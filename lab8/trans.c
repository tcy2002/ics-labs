/* 
 * trans.c - Matrix transpose B = A^T
 *
 * name: Tong Chuyan
 * ID: 520021910934
 *
 * Each transpose function must have a prototype of the form:
 * void trans(int M, int N, int A[N][M], int B[M][N]);
 *
 * A transpose function is evaluated by counting the number of misses
 * on a 1KB direct mapped cache with a block size of 32 bytes.
 */ 
#include <stdio.h>
#include "cachelab.h"

int is_transpose(int M, int N, int A[N][M], int B[M][N]);

/* 
 * transpose_submit - This is the solution transpose function that you
 *     will be graded on for Part B of the assignment. Do not change
 *     the description string "Transpose submission", as the driver
 *     searches for that string to identify the transpose function to
 *     be graded. 
 */
char transpose_submit_desc[] = "Transpose submission";
void transpose_submit(int M, int N, int A[N][M], int B[M][N])
{
    int i, j, x, y;
    int x1, x2, x3, x4, x5, x6, x7, x8;

    /* 64x64 : 8x8 block and some management to avoid conflict misses */
    if (M == 64) {
        for (i = 0; i < N; i += 8) {
            for (j = 0; j < M; j += 8) {
                /*
                 *           *******************
                 *           * *       * A * B *
                 *           *   *     *********
                 *           *     *   *   *   *
                 *           *       * *********
                 *           ********* *       *
                 *           * a * b *   *     *
                 *           *********     *   *
                 *           *   *   *       * *
                 *           *******************
                 * 
                 * First, due to the fact that every four lines fill the 
                 * entire cache, we fetch only four lines at a time from 
                 * A(4x4 block) and save them into the first four lines 
                 * of the corresponding block in B, i.e. A&B -> a&b, and 
                 * a(b) is the transposition of A(B)
                 */
                for (x = i; x < i + 4; x++) {
                    x1 = A[x][j];
                    x2 = A[x][j + 1];
                    x3 = A[x][j + 2];
                    x4 = A[x][j + 3];
                    x5 = A[x][j + 4];
                    x6 = A[x][j + 5];
                    x7 = A[x][j + 6];
                    x8 = A[x][j + 7];

                    B[j][x] = x1;
                    B[j + 1][x] = x2;
                    B[j + 2][x] = x3;
                    B[j + 3][x] = x4;
                    B[j][x + 4] = x5;
                    B[j + 1][x + 4] = x6;
                    B[j + 2][x + 4] = x7;
                    B[j + 3][x + 4] = x8;
                }

                /*
                 *           *******************
                 *           * *       *   *   *
                 *           *   *     *********
                 *           *     *   * C *   *
                 *           *       * *********
                 *           ********* *       *
                 *           * a * c *   *     *
                 *           *********     *   *
                 *           * b *   *       * *
                 *           ******************* 
                 * 
                 * Second, we fetch block C of array A by rows and save 
                 * them into block c in array B. In the meantime, 
                 * previously saved block b is moved to the final 
                 * position before the previous position is occupied by 
                 * block c.
                 * 
                 */
                for (y = j; y < j + 4; y++) {
                    x1 = A[i + 4][y];
                    x2 = A[i + 5][y];
                    x3 = A[i + 6][y];
                    x4 = A[i + 7][y];
                    x5 = B[y][i + 4];
                    x6 = B[y][i + 5];
                    x7 = B[y][i + 6];
                    x8 = B[y][i + 7];

                    B[y][i + 4] = x1;
                    B[y][i + 5] = x2;
                    B[y][i + 6] = x3;
                    B[y][i + 7] = x4;
                    B[y + 4][i] = x5;
                    B[y + 4][i + 1] = x6;
                    B[y + 4][i + 2] = x7;
                    B[y + 4][i + 3] = x8;
                }

                /*
                 *           *******************
                 *           * *       *   *   *
                 *           *   *     *********
                 *           *     *   *   * D *
                 *           *       * *********
                 *           ********* *       *
                 *           * a * c *   *     *
                 *           *********     *   *
                 *           * b * d *       * *
                 *           *******************
                 *           
                 * At last, block D of array A is saved to its expected 
                 * position d in array B. The entire 8x8 block of A is
                 * correctly transposed and saved into B.
                 */
                for (x = i + 4; x < i + 8; x++) {
                    x1 = A[x][j + 4];
                    x2 = A[x][j + 5];
                    x3 = A[x][j + 6];
                    x4 = A[x][j + 7];
                    
                    B[j + 4][x] = x1;
                    B[j + 5][x] = x2;
                    B[j + 6][x] = x3;
                    B[j + 7][x] = x4;
                }
            }
        }
    }


    /* 32x32 or 61x67 : 8x8 block */
    else {
        for (i = 0; i < N; i += 8) {
            for (j = 0; j < M; j += 8) {
                /*
                 * For each 8x8 block, we fetch 8 number from A at a time,
                 * and save them into the expected position in B. 
                 */
                for (x = i; x < i + 8 && x < N; x++) {
                    x1 = A[x][j];
                    x2 = A[x][j + 1];
                    x3 = A[x][j + 2];
                    x4 = A[x][j + 3];
                    x5 = A[x][j + 4];
                    if (j + 5 < M) {
                        x6 = A[x][j + 5];
                        x7 = A[x][j + 6];
                        x8 = A[x][j + 7];
                    }

                    B[j][x] = x1;
                    B[j + 1][x] = x2;
                    B[j + 2][x] = x3;
                    B[j + 3][x] = x4;
                    B[j + 4][x] = x5;
                    if (j + 5 >= M) continue;
                    B[j + 5][x] = x6;
                    B[j + 6][x] = x7;
                    B[j + 7][x] = x8;
                }
            }
        }
    }
}

/* 
 * You can define additional transpose functions below. We've defined
 * a simple one below to help you get started. 
 */ 

/* 
 * trans - A simple baseline transpose function, not optimized for the cache.
 */
char trans_desc[] = "Simple row-wise scan transpose";
void trans(int M, int N, int A[N][M], int B[M][N])
{
    int i, j, tmp;

    for (i = 0; i < N; i++) {
        for (j = 0; j < M; j++) {
            tmp = A[i][j];
            B[j][i] = tmp;
        }
    }    

}

/*
 * registerFunctions - This function registers your transpose
 *     functions with the driver.  At runtime, the driver will
 *     evaluate each of the registered functions and summarize their
 *     performance. This is a handy way to experiment with different
 *     transpose strategies.
 */
void registerFunctions()
{
    /* Register your solution function */
    registerTransFunction(transpose_submit, transpose_submit_desc); 

    /* Register any additional transpose functions */
    registerTransFunction(trans, trans_desc); 

}

/* 
 * is_transpose - This helper function checks if B is the transpose of
 *     A. You can check the correctness of your transpose by calling
 *     it before returning from the transpose function.
 */
int is_transpose(int M, int N, int A[N][M], int B[M][N])
{
    int i, j;

    for (i = 0; i < N; i++) {
        for (j = 0; j < M; ++j) {
            if (A[i][j] != B[j][i]) {
                return 0;
            }
        }
    }
    return 1;
}

