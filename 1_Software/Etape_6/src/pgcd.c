#include "stdio.h"
#include "stdlib.h"
#include "math.h"
#include <assert.h>
#include "pgcd.h"

int PGCD(int A, int B)
{
	assert(A < 65536);
	assert(B < 65536);
	assert(A >= 0);
	assert(B >= 0);

	int Entree_A = A;
	int Entree_B = B;
	if (A == 0 && B == 0) return 0;
	else if (B == 0) return A;
	else if (A == 0) return B;

	while(A!=B){
		if (A > B) A = A-B;
		else B = B-A;
	}
	assert(A >= 0);
	assert(A <= Entree_A);
	assert(A <= Entree_B);
	assert((Entree_A %A) == 0);
	assert((Entree_B %A) == 0);
	return A;
}
