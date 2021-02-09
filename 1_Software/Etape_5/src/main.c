#include "stdio.h"
#include "stdlib.h"
#include "math.h"
#include "time.h"
#include <assert.h>

int RandA()
{
	return rand()%65536;
}
int RandB()
{
	return rand()%65536;
}

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
	assert(A < Entree_A);
	assert(A < Entree_B);
	assert((Entree_A %A) == 0);
	assert((Entree_B %A) == 0);
	return A;
}

int main (int argc, char * argv []){
	printf("(II) Starting PGCD program\n");

	PGCD(10,5);

	printf("(II) End of PGCD program\n");
  return 0;
}
