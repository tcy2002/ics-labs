/*
 * mm-naive.c - The fastest, least memory-efficient malloc package.
 * 
 * In this naive approach, a block is allocated by simply incrementing
 * the brk pointer.  A block is pure payload. There are no headers or
 * footers.  Blocks are never coalesced or reused. Realloc is
 * implemented directly using mm_malloc and mm_free.
 *
 * NOTE TO STUDENTS: Replace this header comment with your own header
 * comment that gives a high level description of your solution.
 */
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <unistd.h>
#include <string.h>

#include "mm.h"
#include "memlib.h"

/* single word (4) or double word (8) alignment */
#define ALIGNMENT 8

/* rounds up to the nearest multiple of ALIGNMENT */
#define ALIGN(size) (((size) + (ALIGNMENT-1)) & ~0x7)


#define SIZE_T_SIZE (ALIGN(sizeof(size_t)))

#define WSIZE 4
#define DSIZE 8
#define CHUNKSIZE (1<<12)

#define MAX(x, y) ((x) > (y) ? (x) : (y))

#define PACK(size, alloc) ((size) | (alloc))

#define GET(p) (*(unsigned int *)(p))
#define PUT(p, val) (*(unsigned int *)(p) = (val)) 

#define GET_SIZE(p) (GET(p) & ~0x7)
#define GET_ALLOC(p) (GET(p) & 0x1)

#define HDRP(bp) ((char *)(bp) - WSIZE)
#define FTRP(bp) ((char *)(bp) + GET_SIZE(HDRP(bp)) - DSIZE)

#define NEXT_BLKP(bp) ((char *)(bp) + GET_SIZE(((char *)(bp) - WSIZE)))
#define PREV_BLKP(bp) ((char *)(bp) - GET_SIZE(((char *)(bp) - DSIZE)))

#define TO_PTR(offset) (heap_listp + offset)
#define FROM_PTR(bp) ((char *)bp - heap_listp)

#define NEXT_FBLKP(bp) (TO_PTR(GET((char *)(bp) + WSIZE)))
#define PREV_FBLKP(bp) (TO_PTR(GET(bp)))
#define IS_EMPTY_BLKP(bp) (bp == heap_listp)

#define SET_PREV_PTR(bp, val) (PUT(bp, val))
#define SET_NEXT_PTR(bp, val) (PUT((char *)(bp) + WSIZE, (val)))

#define MEM_HEAP_LO (heap_listp - 40)

static char *heap_listp;

static void *coalesce(void *bp);
static void *extend_heap(size_t words);
static void *find_fit(size_t asize);
static void place(void *bp, size_t asize);

static void *get_flist_headp(size_t asize);

static void add_to_flist(void *bp);
static void del_from_flist(void *bp);

static int mm_checker();


static void *coalesce(void *bp)
{
    //printf("start_coalesce\n");

    char *prev = PREV_BLKP(bp);
    char *next = NEXT_BLKP(bp);
    size_t prev_alloc = GET_ALLOC(FTRP(prev));
    size_t next_alloc = GET_ALLOC(HDRP(next));
    size_t size = GET_SIZE(HDRP(bp));

    if (prev_alloc && !next_alloc) {
        del_from_flist(next);

        size += GET_SIZE(HDRP(next));
        PUT(HDRP(bp), PACK(size, 0));
        PUT(FTRP(bp), PACK(size, 0));
    } else if (!prev_alloc && next_alloc) {
        del_from_flist(prev);

        size += GET_SIZE(HDRP(prev));
        PUT(FTRP(bp), PACK(size, 0));
        PUT(HDRP(prev), PACK(size, 0));

        bp = prev;
    } else if (!prev_alloc && !next_alloc) {
        del_from_flist(prev);
        del_from_flist(next);

        size += GET_SIZE(HDRP(PREV_BLKP(bp))) + 
                GET_SIZE(FTRP(NEXT_BLKP(bp)));
        PUT(HDRP(prev), PACK(size, 0));
        PUT(FTRP(next), PACK(size, 0));

        bp = prev;
    }

    add_to_flist(bp);

    //printf("success_coalesce**********************\n");
    
    return bp;
}

static void *extend_heap(size_t words) 
{
    //printf("start_extend_heap\n");

    char *bp;
    size_t size;

    size = (words % 2) ? (words + 1) * WSIZE : words * WSIZE;
    if ((long)(bp = mem_sbrk(size)) == -1) return NULL;

    PUT(HDRP(bp), PACK(size, 0));
    PUT(FTRP(bp), PACK(size, 0));
    PUT(HDRP(NEXT_BLKP(bp)), PACK(0, 1));

    //printf("success_extend_heap\n");

    return coalesce(bp);
}

static void *find_fit(size_t asize)
{
    //printf("start_find_fit %ld\n", asize);

    char *flist_headp = get_flist_headp(asize);
    char *head = MEM_HEAP_LO;
    char *bp;

    //printf("start_find_fit %ld\n", flist_headp - head);

    while (flist_headp >= head) {

        //printf("****find_fit %ld\n", flist_headp - head);

        bp = TO_PTR(GET(flist_headp));

        while (!IS_EMPTY_BLKP(bp)) {
            if (GET_SIZE(HDRP(bp)) >= asize) {

                //printf("success_find_fit %d\n", GET_SIZE(HDRP(bp)));

                return bp;
            }
            bp = NEXT_FBLKP(bp);
        }

        flist_headp -= 4;
    }

    //printf("success_find_fit 0\n");

    return NULL;
}

static void place(void *bp, size_t asize)
{
    //printf("start_place\n");

    size_t size = GET_SIZE(HDRP(bp));
    size_t rest = size - asize;
    char *p;

    del_from_flist(bp);

    if (rest >= 2 * DSIZE) {
        PUT(HDRP(bp), PACK(asize, 1));
        PUT(FTRP(bp), PACK(asize, 1));

        p = NEXT_BLKP(bp);
        PUT(HDRP(p), PACK(rest, 0));
        PUT(FTRP(p), PACK(rest, 0));

        add_to_flist(p);
    } else {
        PUT(HDRP(bp), PACK(size, 1));
        PUT(FTRP(bp), PACK(size, 1));
    }

    //printf("success_place\n");
}

static void *get_flist_headp(size_t asize)
{
    //printf("start_get_flist_headp\n");

    asize >>= 5;
    if (asize > 128) {

        //printf("success_flist_headp\n");

        return heap_listp - 40;
    }

    char *flist_headp = heap_listp - 8;
    while (asize > 0) {
        asize >>= 1;
        flist_headp -= 4;
    }

    //printf("success_get_flist_headp %d\n", GET(flist_headp));

    return flist_headp;
}

static void add_to_flist(void *bp)
{
    //printf("start_add_to_flist\n");

    size_t size = GET_SIZE(HDRP(bp));

    char *flist_headp = get_flist_headp(size);

    SET_PREV_PTR(bp, 0);
    SET_NEXT_PTR(bp, GET(flist_headp));
    PUT(flist_headp, FROM_PTR(bp));

    bp = NEXT_FBLKP(bp);
    if (!IS_EMPTY_BLKP(bp)) SET_PREV_PTR(bp, GET(flist_headp));
    
    //printf("success_add_to_flist\n");
}

static void del_from_flist(void *bp)
{
    //printf("start_del_to_flist\n");
    
    char *prev_fbp = PREV_FBLKP(bp);
    char *next_fbp = NEXT_FBLKP(bp);

    if (IS_EMPTY_BLKP(prev_fbp)) {
        char *flist_headp = get_flist_headp(GET_SIZE(HDRP(bp)));
        PUT(flist_headp, FROM_PTR(next_fbp));
    } else {

        //printf("start_del_to_flist %ld\n", FROM_PTR(next_fbp));

        SET_NEXT_PTR(prev_fbp, FROM_PTR(next_fbp));

        //printf("start_del_to_flist\n");

    }
    if (!IS_EMPTY_BLKP(next_fbp)) {
        SET_PREV_PTR(next_fbp, FROM_PTR(prev_fbp));
    }

    //printf("success_del_to_flist\n");
}

static int mm_checker()
{
    char *bp = heap_listp - 8;

    printf("\n***************check begin***************\n");

    printf("flist_headps: \n");
    for (int i = 0; i < 9; i++) {
        printf("%d:\t%d\n", 16 << i, GET(bp));
        bp -= 4;
    }

    bp = heap_listp;
    printf("\nblocks: \n");
    while (GET_SIZE(HDRP(bp)) != 0) {
        if (GET_SIZE(HDRP(bp)) != GET_SIZE(FTRP(bp)) && GET_ALLOC(HDRP(bp)) == 0) {
            printf("error: inconsistency of header and footer\n");

            while (!IS_EMPTY_BLKP(bp)) {
                printf("header: %d %d\n", GET_SIZE(HDRP(bp)), GET_ALLOC(HDRP(bp)));
                printf("footer: %d %d\n", GET_SIZE(FTRP(bp)), GET_ALLOC(FTRP(bp)));
                printf("pos: %ld\n", FROM_PTR(bp));

                bp = NEXT_FBLKP(bp);
	    }

            break;
        }

        bp = NEXT_BLKP(bp);
    }

    printf("****************check end****************\n\n");

    return 0;
}

/* 
 * mm_init - initialize the malloc package.
 */
int mm_init(void)
{
    //printf("start_init\n");
    if ((heap_listp = mem_sbrk(12 * WSIZE)) == (void *)-1) return -1;

    PUT(heap_listp, 0);
    PUT(heap_listp + WSIZE, 0);
    PUT(heap_listp + (2 * WSIZE), 0);
    PUT(heap_listp + (3 * WSIZE), 0);
    PUT(heap_listp + (4 * WSIZE), 0);
    PUT(heap_listp + (5 * WSIZE), 0);
    PUT(heap_listp + (6 * WSIZE), 0);
    PUT(heap_listp + (7 * WSIZE), 0);
    PUT(heap_listp + (8 * WSIZE), 0);

    PUT(heap_listp + (9 * WSIZE), PACK(DSIZE, 1));
    PUT(heap_listp + (10 * WSIZE), PACK(DSIZE, 1));
    PUT(heap_listp + (11 * WSIZE), PACK(0, 1));
    heap_listp += (10 * WSIZE);

    if (extend_heap(CHUNKSIZE / WSIZE) == NULL) return -1;

    //printf("success_init\n");

    //mm_checker();

    return 0;
}

/* 
 * mm_malloc - Allocate a block by incrementing the brk pointer.
 *     Always allocate a block whose size is a multiple of the alignment.
 */
void *mm_malloc(size_t size)
{
    //printf("start_malloc %ld\n", size);

    size_t asize;
    size_t extendsize;
    char *bp;

    if (size == 0) return NULL;

    if (size <= DSIZE) asize = 2 * DSIZE;
    else asize = DSIZE * ((size + (DSIZE) + (DSIZE - 1)) / DSIZE);

    if ((bp = find_fit(asize)) != NULL) {
        place(bp, asize);

        //printf("success_malloc\n");

        //mm_checker();

        return bp;
    }

    extendsize = MAX(asize, CHUNKSIZE);
    if ((bp = extend_heap(extendsize / WSIZE)) == NULL)
        return NULL;
    place(bp, asize);

    //printf("success_malloc\n");

    //mm_checker();

    return bp;
}

/*
 * mm_free - Freeing a block does nothing.
 */
void mm_free(void *ptr)
{
    //printf("start_free\n");

    size_t size = GET_SIZE(HDRP(ptr));

    PUT(HDRP(ptr), PACK(size, 0));
    PUT(FTRP(ptr), PACK(size, 0));

    coalesce(ptr);

    //printf("success_free\n");

    //mm_checker();
}

/*
 * mm_realloc - Implemented simply in terms of mm_malloc and mm_free
 */
void *mm_realloc(void *ptr, size_t size)
{
    if (ptr == NULL) return mm_malloc(size);
    if (size == 0) { mm_free(ptr); return NULL; }

    void *oldptr = ptr;
    void *newptr;
    size_t copySize;
    
    newptr = mm_malloc(size);
    if (newptr == NULL) return NULL;
    copySize = *(size_t *)((char *)oldptr - SIZE_T_SIZE);
    if (size < copySize)
      copySize = size;
    memcpy(newptr, oldptr, copySize);
    mm_free(oldptr);
    return newptr;
}

