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
	if (A == 0 && B == 0) return 0;
	if (B == 0) return A;
	if (A == 0) return B;

		while(A!=B){
			if (A > B) A = A-B;
			else B = B-A;
	}
	return A;
}
int PGCD_compare(int A, int B)
{
	int C = 0;
	if (A == 0 && B == 0) return 0;
	else if (B == 0) return A;
	else if (A == 0) return B;

	while(B !=0){
		C = A;
		A = B;
		B = C % B;

	}
	return A;
}

int main (int argc, char * argv []){
	printf("(II) Starting PGCD program\n");
	int A;
	int B;
	srand( time( NULL ) );

	for (int i = 0; i <20; ++i) {
		A = RandA();
		B = RandB();
		//A=10;
		//B = 20;
		printf("(%d) : PGCD(%d;%d) = %d -- PGCD_compare(%d;%d) = %d\n",
														i,A,B,PGCD(A,B),A,B,PGCD_compare(A,B));
	}
	printf("(II) End of PGCD program\n");
  return 0;
}
