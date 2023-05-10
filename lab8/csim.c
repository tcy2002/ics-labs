/*
 * csim - A simulator of cache
 *
 * name: Tong Chuyan
 * ID: 520021910934
 */

#include <stdio.h>
#include <getopt.h>
#include <unistd.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "cachelab.h"

/* Cache variables */
int s = 0;	/* group index bit */
int S = 0;	/* number of sets */
int E = 0;	/* number of lines per set */
int b = 0;	/* number of block offset bits */
char *t = NULL;	/* relative path of input file */

/* whether to print message of each step */
int visible = 0;

/* results */
int hits_num = 0;
int misses_num = 0;
int evictions_num = 0;

/* macros */
#define MAX_LINE 20
#define PARSE_TAG(addr) ((addr) >> (s + b))
#define PARSE_GID(addr) (((addr) << (64 - s - b)) >> (64 - s))

/* linked list node */
typedef struct node {
    int line_id;
    struct node *next;
} node_t;

/* structs defined for cache simulator */
typedef struct line {
    int valid_bit;
    unsigned long tag;
} line_t;
typedef struct set {
    line_t *lines;
    node_t *least; /* linked list to record the access order */
} set_t;
typedef struct cache {
    set_t *sets;
} cache_t;

/**
 * Print the help information.
 */
void usage() {
    printf("Usage: ./csim-ref [-hv] -s <num> -E <num> -b <num> -t <file>\n");
    printf("Options:\n");
    printf("-h         Print this help message.\n");
    printf("-v         Optional verbose flag.\n");
    printf("-s <num>   Number of set index bits.\n");
    printf("-E <num>   Number of lines per set.\n");
    printf("-b <num>   Number of block offset bits.\n");
    printf("-t <file>  Trace file.\n\n");
    printf("Examples:\n");
    printf("linux>  ./csim-ref -s 4 -E 1 -b 4 -t traces/yi.trace\n");
    printf("linux>  ./csim-ref -v -s 8 -E 2 -b 4 -t traces/yi.trace)\n");
    exit(0);
}

/**
 * Initialize the cache memory.
 * @param cac pointer to a cache.
 */
void initCache(cache_t *cac) {
    S = (int)pow(2, s); /* calculate the number of sets */

    /* allocate memory for sets */
    cac->sets = (set_t *)malloc(sizeof(set_t) * S);
    set_t *set;
    for (int i = 0; i < S; i++) {
        set = &(cac->sets[i]);

        /* allocate memory for recording list head of a set */
        set->least = (node_t *)malloc(sizeof(node_t));
        set->least->next = NULL;
        set->least->line_id = -1;

        /* allocate memory for lines of a set */
        set->lines = (line_t *)malloc(sizeof(line_t) * E);
        memset(set->lines, 0, sizeof(line_t) * E);
    }
}

/**
 * Add current accessed line to the recording list.
 * @param ss pointer to a set.
 * @param i current accessed line index.
 */
void add_to_list(set_t *ss, int i) {
    node_t *p = ss->least, *tmp = NULL;

    /* delete the same node from the recording list */
    while (p->next != NULL) {
        if (p->next->line_id == i) {
            tmp = p->next;
            p->next = p->next->next;
            continue;
        }
        p = p->next;
    }

    /* add the current node to the recording list */
    if (tmp == NULL) {
        tmp = (node_t *)malloc(sizeof(node_t));
        tmp->line_id = i;
    }
    tmp->next = NULL;
    p->next = tmp;
}

/**
 * Get the least-used line index and remove it from the recording list.
 * @param ss pointer to a set.
 * @return least-used line index.
 */
int get_from_list(set_t *ss) {
    if (ss->least->next == NULL) return -1;

    /* get the least-used line index and remove it from the recording list */
    node_t *tmp = ss->least->next;
    int id = tmp->line_id;
    ss->least->next = tmp->next;
    free(tmp);

    return id;
}

/**
 * Search one set by a tag.
 * @param ss pointer to a set.
 * @param tag tag
 * @return 1 if found, 0 if not.
 */
int search(set_t *ss, unsigned long tag) {
    for (int i = 0; i < E; i++) {
        if (ss->lines[i].valid_bit == 1 && ss->lines[i].tag == tag) {
            add_to_list(ss, i); /* add to the recording list */
            return 1;
        }
    }
    return 0;
}

/**
 * Fetch data from memory to cache.
 * @param ss pointer to a set.
 * @param tag tag 
 * @return 1 if the set has an available line, 0 if not
 */
int fetch(set_t *ss, unsigned long tag) {
    for (int i = 0; i < E; i++) {
        if (ss->lines[i].valid_bit == 0) {
            ss->lines[i].valid_bit = 1;
            ss->lines[i].tag = tag;
            add_to_list(ss, i); /* add to the recording list */
            return 1;
        }
    }
    return 0;
}

/**
 * Evict the lease-used line.
 * @param ss pointer to a set.
 * @param tag tag.
 */
void evict(set_t *ss, unsigned long tag) {
    int id;
    if ((id = get_from_list(ss)) == -1) {
        printf("Evict error!");
        exit(0);
    }

    ss->lines[id].tag = tag;
    add_to_list(ss, id); /* readd to the recording list */
}

/**
 * Simulator of load.
 * @param cac pointer to cache.
 * @param addr address to load.
 * @return type of result. 1: hit, 2: miss, 3: miss and eviction
 */
int load_store(cache_t *cac, unsigned long addr) {
    unsigned long tag = PARSE_TAG(addr);
    unsigned long gid = PARSE_GID(addr);
    set_t *ss = &cac->sets[gid];

    /* if found in cache, hit. otherwise miss */
    if (search(ss, tag)) { hits_num++; return 1; }
    misses_num++;

    /* if successfully fetched, return, otherwise need to evict */
    if (fetch(ss, tag)) return 2;
    evictions_num++;

    /* eviction */
    evict(ss, tag);
    return 3;
}

/**
 * Print the hit-or-miss message.
 * @param res response type 
 */
void response(int res) {
    switch (res) {
        case 1: printf("hit "); break;
        case 2: printf("miss "); break;
        case 3: printf("miss eviction "); break;
        default: return;
    }
}

/**
 * Print the message of each step.
 * @param mode operation mode L/S/M.
 * @param addr address to visit.
 * @param len length of data.
 * @param res1 result type of the first operation.
 * @param res2 result type of the second operation.
 */
void msg(char mode, unsigned long addr, int len, int res1, int res2) {
    printf("%c %lx,%d ", mode, addr, len);
    response(res1);
    response(res2);
    printf("\n");
}

/**
 * Reclaim cache memory allocated by malloc.
 * @param cac pointer to a cache.
 */
void reset(cache_t *cac) {
    set_t *set;
    node_t *tmp, *p;
    for (int i = 0; i < S; i++) {
        set = &(cac->sets[i]);
        free(set->lines);

        p = set->least;
        while (p != NULL) {
            tmp = p;
            p = p->next;
            free(tmp);
        }
    }

    free(cac->sets);
}

/**
 * main simulator for cache behavior
 */
void simulator() {
    cache_t cac;
    initCache(&cac);

    char mode;
    unsigned long addr;
    int len;

    FILE *fp;
    if ((fp = fopen(t, "r")) == NULL) {
        printf("Fail to open file!\n");
        exit(0);
    }

    /* parse the input file */
    char line[MAX_LINE];
    char *ptr;
    int res1, res2;
    while ((ptr = fgets(line, MAX_LINE, fp)) != NULL) {
        if (ptr[0] != ' ') continue;
        sscanf(ptr, " %c %lx,%d", &mode, &addr, &len);

        res1 = res2 = 0;
        switch (mode) {
            case 'M':				/* modify */
                res1 = load_store(&cac, addr);
            case 'L': case 'S':			/* load or store */
                res2 = load_store(&cac, addr);
		/* if visible is set, print the message */
                if (visible) msg(mode, addr, len, res1, res2);
                break;
            default:
                printf("Input error!");
                exit(0);
        }
    }

    /* close file and reclaim memory */
    fclose(fp);
    reset(&cac);
}

int main(int argc, char **argv)
{
    int c;
    /* parse the command line */
    while ((c = getopt(argc, argv, "hvs:E:b:t:")) != -1) {
        switch (c) {
            case 'h': usage(); break;
            case 'v': visible = 1; break;
            case 's': s = strtol(optarg, NULL, 10); break;
            case 'E': E = strtol(optarg, NULL, 10); break;
            case 'b': b = strtol(optarg, NULL, 10); break;
            case 't': t = optarg; break;
            default: usage(); break;
        }
    }
    if (s == 0 || E == 0 || b == 0 || t == NULL) {
        printf("./csim-ref: Missing required command line argument\n");
        exit(0);
    }

    /* simulate */
    simulator();
    /* print the results */
    printSummary(hits_num, misses_num, evictions_num);
    return 0;
}

//printf("%d %d %d", hits_num, misses_num, evictions_num);

