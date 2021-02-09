#include "stdio.h"
#include "stdlib.h"
#include "math.h"
#include "time.h"

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
	assert(B >=0);

	if (A == 0 && B == 0) return 0;
	if (B == 0) return A;
	if (A == 0) return B;
	
	while(A!=B){
		if (A > B) A = A-B;
		else B = B-A;
	}
	return A;
}


//On tombe sur une valeur nulle, donc le programme plante
int main (int argc, char * argv []){
	printf("(II) Starting PGCD program\n");
	int A = 0;
	int B = 0;
	srand( time( NULL ) );

	for (int i = 0; i <200000; ++i) {
		A = RandA();
		B = RandB();
		printf("(%d) : PGCD(%d;%d) = %d\n",i,A,B,PGCD(A,B));
	}
	printf("(II) End of PGCD program\n");
  return 0;
}
