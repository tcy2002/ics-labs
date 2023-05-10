/*
 * Tong Chuyan 520021910934
 *
 * overview
 *     - the main structure is similar to what's descripted in the 
 *       textbook (picture 9-42).
 *     - strategy used: segregated fit, explicit linked free list, 
 *       free lists in ascendng order of size, first fit
 *     - block size is also specially designed.
 *
 * block
 *     - minimum size: 16 (bytes)
 *     - alignment: 8 (bytes)
 *     - structure: there is a header and a footer storing the size 
 *       of block and the allocated bit. the payload is between the 
 *       header and the footer. free blocks additionally contains two 
 *       pointers in their body, each pointing to the previous or next 
 *       free block. (explicit linked list)
 *
 * free list
 *     - size class: 16~24, 32~56, 64~120, 128~248, 256~504, 512~1016, 
         1024~2040, 2048~4088, 4096~more.
 *     - strategy: ascending by size, first fit
 *     - storage: not using global variables, the head pointer of 
 *       each free list is stored in the heap before the intro block.
 *
 * block size
 *     - in the the previous edition, block size is just aligned
 *       to 8 to minimize the internal fragments, but test cases 8
 *       and 9 have low utilization due to many external fragments,
 *       which is caused by the bizarre order of malloc and free in the 
 *       two cases.
 *     - strategy: to solve the problem mentioned above, the block
 *       size is not simply aligned to 8, but aligned to a length that
 *       varies by size. after doing so, no more new malloc and memory
 *       copy is needed in realloc in test cases 8 and 9. even other 
 *       test cases are slightly promoted.
 *
 * editions
 *     1. simply copy the code in the textbook. score: 45
 *     2. use explicit linked free list and 9 size classes
 *        score: 52 (just?)
 *     3. rewrite the mm_realloc: when the target block is followed
 *        by a free block and has enough size, don't malloc. score: 58
 *     4. further improve the realloc: when the target block is the last
 *        block in heap, do not malloc, but apply for new spaces and 
 *        merge. the size is not fixed to CHUNKSIZE when extending the 
 *        heap, but depends on requirements. score: 92 (huge progress!)
 *     5. change the block size strategy to further optimize test cases 
 *        8 and 9. score: 97
 *     6. according to the suggestion of my roommate, rearrange the free
 *        list in ascending order of block size. score: 98
 *     (many more small modifications between each edition)
 */
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <unistd.h>
#include <string.h>

#include "mm.h"
#include "memlib.h"

/* Basic constants and macros */
#define WSIZE 4	   /* Word size (bytes) */
#define DSIZE 8	   /* Double word size (bytes) */
#define MINBLK 16  /* Minimum block size (bytes)  */

/* Alignment for block content */
#define ALIGN(size, align) (((size) + ((align) - 1)) & ~((align) - 1))

/* Aligned size of size_t */
#define SIZE_T_SIZE (ALIGN(sizeof(size_t), 8))

/* Pack a size with allocated bit */
#define PACK(size, alloc) ((size) | (alloc))

/* Read and write a aword at address p */
#define GET(p) (*(unsigned int *)(p))
#define PUT(p, val) (*(unsigned int *)(p) = (val)) 

/* Read the size and allocated bit from address p */
#define GET_SIZE(p) (GET(p) & ~0x7)
#define GET_ALLOC(p) (GET(p) & 0x1)

/* Read the address of header/footer */
#define HDRP(bp) ((char *)(bp) - WSIZE)
#define FTRP(bp) ((char *)(bp) + GET_SIZE(HDRP(bp)) - DSIZE)

/* Compute the address of previous/next block */
#define NEXT_BLKP(bp) ((char *)(bp) + GET_SIZE(((char *)(bp) - WSIZE)))
#define PREV_BLKP(bp) ((char *)(bp) - GET_SIZE(((char *)(bp) - DSIZE)))

/* Conversion between block pointer and offset */
#define TO_PTR(offset) (heap_listp + (offset))
#define FROM_PTR(bp) ((char *)(bp) - heap_listp)

/* Decide whether a block pointer is empty */
#define IS_EMPTY_BLKP(bp) ((bp) == heap_listp)

/* Decide whether a block pointer is valid */
#define IS_VALID_BLKP(bp) \
((bp) >= (char *)mem_heap_lo() && (bp) <= (char *)mem_heap_hi() + 1)

/* Read the pointers in free block */
#define GET_PREV_PTR(bp) (GET(bp))
#define GET_NEXT_PTR(bp) (GET((char *)(bp) + WSIZE))

/* Modify the pointers in free block */
#define SET_PREV_PTR(bp, val) (PUT(bp, val))
#define SET_NEXT_PTR(bp, val) (PUT((char *)(bp) + WSIZE, (val)))

/* Compute the address of previous/next free block in free list */
#define PREV_FBLKP(bp) (TO_PTR(GET_PREV_PTR(bp)))
#define NEXT_FBLKP(bp) (TO_PTR(GET_NEXT_PTR(bp)))

/* the pointer to the first byte in the heap */
#define MEM_HEAP_LO (heap_listp - 40)

/* print error message and exit */
#define ERROR(msg, bp) { \
    printf("error: %s\n", (msg)); \
    printf("at: %ld\n", FROM_PTR(bp)); \
    exit(-1); \
}

static char *heap_listp;

/* Functions that read and modify blocks */
static void *coalesce(void *bp);
static void *extend_heap(size_t words);
static void *find_fit(size_t asize);
static void place(void *bp, size_t size, size_t asize);
static size_t get_blk_size(size_t size);

/* Functions that read and modify free lists */
static void *get_flist_headp(size_t asize);
static void add_to_flist(void *bp, size_t size);
static void del_from_flist(void *bp, size_t size);

/* Heap consistency checker */
static int mm_checker();

/* Interfaces */
int mm_init(void);
void *mm_malloc(size_t size);
void mm_free(void *ptr);
void *mm_realloc(void *ptr, size_t size);


/*
 * get_blk_size - compute the body size by
 * special strategy.
 */
size_t get_blk_size(size_t size)
{
    size_t align;
    size_t asize = size;

    /* alignment for size smaller than 32 
       or bigger than 4096 */
    if (asize <= 32)
        align = 8;
    /* alignment for size between 512 and 4096 */
    else if (asize > 512) 
        align = 128;
    /* alignment for size between 32 and 512,
       based on index interval:
       40   ~ 64  :  16
       72   ~ 128 :  32
       136  ~ 256 :  64 
       264  ~ 512 :  128 */
    else {
        align = 1;
        size = (size - 1) >> 2;
        while (size > 0) {
            size >>= 1;
            align <<= 1;
        }
    }

    asize = asize > MINBLK ? ALIGN(asize, align) : MINBLK;
    return asize + DSIZE;
}


/*
 * coalesce - Coalesce adjacenet free blocks.
 * given the raw block pointer, return the coalesced new one.
 */
static void *coalesce(void *bp)
{
    /* To avoid repeated computing, the variables
       are declared and initialized in advance */
    char *prev = PREV_BLKP(bp);
    char *next = NEXT_BLKP(bp);
    size_t prev_alloc = GET_ALLOC(FTRP(prev));
    size_t next_alloc = GET_ALLOC(HDRP(next));
    size_t size = GET_SIZE(HDRP(bp));
    size_t size_prev, size_next;

    /* next block is free, but previous is not */
    if (prev_alloc && !next_alloc) {
        size_next = GET_SIZE(HDRP(next));

        del_from_flist(next, size_next);

        size += size_next;
        PUT(HDRP(bp), PACK(size, 0));
        PUT(FTRP(bp), PACK(size, 0));
    } 

    /* previous block is free but next is not */
    else if (!prev_alloc && next_alloc) {
        size_prev = GET_SIZE(HDRP(prev));

        del_from_flist(prev, size_prev);

        size += size_prev;
        PUT(FTRP(bp), PACK(size, 0));
        PUT(HDRP(prev), PACK(size, 0));

        bp = prev;
    } 

    /* both previous and next blocks are free */
    else if (!prev_alloc && !next_alloc) {
        size_prev = GET_SIZE(HDRP(prev));
        size_next = GET_SIZE(FTRP(next));

        del_from_flist(prev, size_prev);
        del_from_flist(next, size_next);

        size += size_prev + size_next;
        PUT(HDRP(prev), PACK(size, 0));
        PUT(FTRP(next), PACK(size, 0));

        bp = prev;
    }

    add_to_flist(bp, size);

    /* note: if both previous and next blocks are
       allocated, simply do nothing and return */
    return bp;
}

/*
 * extend_heap - apply for new heap space.
 * given the size need to extend, return the pointer
 * to the beginning of the new space.
 */
static void *extend_heap(size_t size) 
{
    char *bp;

    if ((long)(bp = mem_sbrk(size)) == -1) return NULL;

    /* Write the new header and footer */
    PUT(HDRP(bp), PACK(size, 0));
    PUT(FTRP(bp), PACK(size, 0));
    PUT(HDRP(NEXT_BLKP(bp)), PACK(0, 1));

    /* add to free list and return */
    add_to_flist(bp, size);
    return bp;
}

/* 
 * find_fit - find a free block in free lists that fits
 * the needed size.
 * strategy: first fit.
 * given the expected size, return the fitting block
 * pointer.
 */
static void *find_fit(size_t asize)
{
    char *flist_headp = get_flist_headp(asize);
    char *head = MEM_HEAP_LO;
    char *bp;

    /* search the free lists for fitting block */
    while (flist_headp >= head) {
        bp = TO_PTR(GET(flist_headp));

        while (!IS_EMPTY_BLKP(bp)) {
            if (GET_SIZE(HDRP(bp)) >= asize)
                return bp;
            bp = NEXT_FBLKP(bp);
        }

        flist_headp -= 4;
    }

    /* no fitting block is found */
    return NULL;
}

/*
 * place - Write a new block into the given address.
 * given the address pointer, the block size and
 * the expected size, write the header and footer
 * to the address and split the block if possible.
 */
static void place(void *bp, size_t size, size_t asize)
{
    size_t rest = size - asize;
    char *p;

    /* if the rest space is beyond the minimum block size,
       split and save the rest block into the free list */
    if (rest >= MINBLK) {
        PUT(HDRP(bp), PACK(asize, 1));
        PUT(FTRP(bp), PACK(asize, 1));

        p = NEXT_BLKP(bp);
        PUT(HDRP(p), PACK(rest, 0));
        PUT(FTRP(p), PACK(rest, 0));

        add_to_flist(p, rest);
    } 
    
    /* if no rest space or the rest space is smaller than the
       minimum block size, do not split */
    else {
        PUT(HDRP(bp), PACK(size, 1));
        PUT(FTRP(bp), PACK(size, 1));
    }
}

/* 
 * get_flist_headp - get the free list head pointer 
 * given the block size, return the head pointer
 * of the free list.
 */
static void *get_flist_headp(size_t asize)
{
    asize >>= 5;
    if (asize > 128) 
        return heap_listp - 40;

    char *flist_headp = heap_listp - 8;
    while (asize > 0) {
        asize >>= 1;
        flist_headp -= 4;
    }

    return flist_headp;
}

/*
 * add_to_flist - add a free block to the free list
 * strategy: ascending by size
 * given the block pointer and the block size,
 * add the block to the corresponding free list.
 */
size_t time = 0;
static void add_to_flist(void *bp, size_t size)
{
    char *flist_headp = get_flist_headp(size);
    char *fbp = TO_PTR(GET(flist_headp));

    /* condition that the block should be placed on the front */
    if (IS_EMPTY_BLKP(fbp) || GET_SIZE(HDRP(fbp)) >= size) {
        SET_PREV_PTR(bp, 0);
        SET_NEXT_PTR(bp, FROM_PTR(fbp));
        PUT(flist_headp, FROM_PTR(bp));

        if (!IS_EMPTY_BLKP(fbp))
            SET_PREV_PTR(fbp, FROM_PTR(bp));
    }

    /* insert the block in ascending order */
    else {
        while (!IS_EMPTY_BLKP(NEXT_FBLKP(fbp)) && 
               GET_SIZE(HDRP(NEXT_FBLKP(fbp))) < size)
            fbp = NEXT_FBLKP(fbp);

        SET_PREV_PTR(bp, FROM_PTR(fbp));
        SET_NEXT_PTR(bp, GET_NEXT_PTR(fbp));
        SET_NEXT_PTR(fbp, FROM_PTR(bp));

        fbp = NEXT_FBLKP(bp);
        if (!IS_EMPTY_BLKP(fbp))
            SET_PREV_PTR(fbp, FROM_PTR(bp));
    }
}

/*
 * delete a block from the free list
 */
static void del_from_flist(void *bp, size_t size)
{
    char *prev_fbp = PREV_FBLKP(bp);
    char *next_fbp = NEXT_FBLKP(bp);

    /* modify the list pointer, considering whether
       the previous or next free block is empty */
    if (IS_EMPTY_BLKP(prev_fbp)) {
        char *flist_headp = get_flist_headp(size);
        PUT(flist_headp, FROM_PTR(next_fbp));
    } else
        SET_NEXT_PTR(prev_fbp, FROM_PTR(next_fbp));
    if (!IS_EMPTY_BLKP(next_fbp))
        SET_PREV_PTR(next_fbp, FROM_PTR(prev_fbp));
}

/* 
 * mm_checker - heap consistency checker
 */
static int mm_checker()
{
    char *bp;
    int visible = 1;

    /* print the detailed information if visible is set */
    if (visible) {
        printf("\n***************check begin***************\n");

        /* print the free list head pointers */
        bp = heap_listp - 8;
        printf("flist_headps: \n");
        for (int i = 0; i < 9; i++) {
            printf("%d:\t%d\n", 16 << i, GET(bp));
            bp -= 4;
        }

        /* print the content of each block */
        bp = heap_listp;
        printf("\nblocks: \n");
        while (1) {
            printf("header: %d %d\n", GET_SIZE(HDRP(bp)), GET_ALLOC(HDRP(bp)));
            printf("footer: %d %d\n", GET_SIZE(FTRP(bp)), GET_ALLOC(FTRP(bp)));
            if (!GET_ALLOC(HDRP(bp))) {
                printf("prev ptr: %d\n", GET_PREV_PTR(bp));
                printf("next ptr: %d\n", GET_NEXT_PTR(bp));
            }
            printf("\n");

            bp = NEXT_BLKP(bp);
            if (GET_SIZE(HDRP(bp)) == 0)
                break;

            if (!IS_VALID_BLKP(bp))
                ERROR("illegal block pointer", bp)
        }
        printf("header: %d %d\n", GET_SIZE(HDRP(bp)), GET_ALLOC(HDRP(bp)));

        printf("****************check end****************\n\n");
    } 

    /* check blocks */
    bp = heap_listp;
    while (1) {

        /* each block should have 8-byte header and footer 
           packed with the same size and allocated bit */
        if (GET_SIZE(HDRP(bp)) != GET_SIZE(FTRP(bp)) ||
            GET_ALLOC(HDRP(bp)) != GET_ALLOC(FTRP(bp)))
            ERROR("inconsistent header and footer (maybe overlap)", bp)

        if (!GET_ALLOC(HDRP(bp))) {

            /* adjacent free blocks should be coalseced */
            //if (!GET_ALLOC(HDRP(NEXT_BLKP(bp))))
                //ERROR("adjacent free blocks not coalesced", bp)

            /* free block should store valid free block pointer */
            if (!IS_VALID_BLKP(PREV_FBLKP(bp)) || 
                !IS_VALID_BLKP(NEXT_FBLKP(bp)))
                ERROR("invalid block pointer in free block", bp)

            /* free list should not have non-free block */
            if (!IS_EMPTY_BLKP(NEXT_FBLKP(bp)) && GET_ALLOC(NEXT_FBLKP(bp)))
                ERROR("free list contains non-free block", NEXT_FBLKP(bp))
        }

        bp = NEXT_BLKP(bp);
        if (GET_SIZE(HDRP(bp)) == 0)
            break;

        /* block pointer should be valid (caused by wrong block
           size stored by header or footer*/
        if (!IS_VALID_BLKP(bp))
            ERROR("illegal block pointer", bp)
    }

    return 1;
}

/* 
 * mm_init - initialize the malloc package.
 */
int mm_init(void)
{
    if ((heap_listp = mem_sbrk(12 * WSIZE)) == (void *)-1) 
        return -1;

    /* initialize the free list header (descend in size) */
    PUT(heap_listp, 0);               /* 4096 ~ */
    PUT(heap_listp + WSIZE, 0);       /* 2048 ~ 4088 */
    PUT(heap_listp + (2 * WSIZE), 0); /* 1024 ~ 2040 */
    PUT(heap_listp + (3 * WSIZE), 0); /* 512  ~ 1016 */
    PUT(heap_listp + (4 * WSIZE), 0); /* 256  ~ 504  */
    PUT(heap_listp + (5 * WSIZE), 0); /* 128  ~ 248  */
    PUT(heap_listp + (6 * WSIZE), 0); /* 64   ~ 120  */
    PUT(heap_listp + (7 * WSIZE), 0); /* 32   ~ 56   */
    PUT(heap_listp + (8 * WSIZE), 0); /* 16   ~ 24   */

    /* initialize the intro and tail block */
    PUT(heap_listp + (9 * WSIZE), PACK(DSIZE, 1));
    PUT(heap_listp + (10 * WSIZE), PACK(DSIZE, 1));
    PUT(heap_listp + (11 * WSIZE), PACK(0, 1));

    /* place the head pointer to the intro block */
    heap_listp += (10 * WSIZE);

    /* pre-reserve 136 bytes to cater for the last test case */
    char *bp;
    if ((bp = extend_heap(136)) == NULL)
        return -1;

    //mm_checker();
    return 0;
}

/* 
 * mm_malloc - Allocate a block by incrementing the brk pointer.
 *     Always allocate a block whose size is a multiple of the alignment.
 */
void *mm_malloc(size_t size)
{
    size_t asize;
    size_t extendsize;
    char *bp;

    if (size == 0) return NULL;

    asize = get_blk_size(size);

    /* if no fitting block is found in the free list,
       apply new heap space */
    if ((bp = find_fit(asize)) == NULL)
        if ((bp = extend_heap(asize)) == NULL)
            return NULL;

    extendsize = GET_SIZE(HDRP(bp));
    del_from_flist(bp, extendsize);
    place(bp, extendsize, asize);

    //mm_checker();
    return bp;
}

/*
 * mm_free - Freeing a block does nothing.
 */
void mm_free(void *ptr)
{
    size_t size = GET_SIZE(HDRP(ptr));

    PUT(HDRP(ptr), PACK(size, 0));
    PUT(FTRP(ptr), PACK(size, 0));

    /* coalesce adjacent free blocks and add to free list */
    coalesce(ptr);

    //mm_checker();
}

/*
 * mm_realloc - Implemented simply in terms of mm_malloc and mm_free
 */
void *mm_realloc(void *ptr, size_t size)
{
    /* special cases */
    if (ptr == NULL) 
        return mm_malloc(size);
    if (size == 0) { 
        mm_free(ptr); 
        return NULL; 
    }

    size_t c_size = GET_SIZE(HDRP(ptr));
    size_t n_size = get_blk_size(size);

    /* if the new size is smaller than the old size, 
       simply do nothing and return */
    if (n_size <= c_size)
        return ptr;

    char *next = NEXT_BLKP(ptr);
    size_t add_size = GET_SIZE(HDRP(next));

    /* if the followed block is free or is the tail, 
       need not to realloc, just coalesce new space */
    if (!GET_ALLOC(HDRP(next)) || add_size == 0) {

        /* if the additional space is not satisfactory,
           new heap space is needed */
        if ((c_size += add_size) < n_size) {
            if (add_size > 0)
                del_from_flist(next, add_size);

            if ((long)(next = mem_sbrk(n_size - c_size)) == -1)
                return NULL;

            place(ptr, n_size, n_size);
            PUT(HDRP(NEXT_BLKP(ptr)), PACK(0, 1));

            //mm_checker();
            return ptr;
        } 

        /* if the current size and the additional space satisfy
           the need, just resize the block and return */
        else {
            del_from_flist(next, add_size);
            place(ptr, c_size, n_size);

            //mm_checker();
            return ptr;
        }

    }

    void *oldptr = ptr;
    void *newptr;
    size_t copySize;

    /* if the case matches none of the above, realloc and free */
    if ((newptr = mm_malloc(size)) == NULL) 
        return NULL;
    copySize = *(size_t *)((char *)oldptr - SIZE_T_SIZE);
    if (size < copySize)
        copySize = size;
    memcpy(newptr, oldptr, copySize);
    mm_free(oldptr);

    //mm_checker();
    return newptr;
}

