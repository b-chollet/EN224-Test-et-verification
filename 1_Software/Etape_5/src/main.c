#include "stdio.h"
#include "stdlib.h"
#include "math.h"
#include <assert.h>

int PGCD(int A, int B)
{
	assert(A < 65536);
	assert(B < 65536);
	assert(A >= 0);
	assert(B >=0);

	while(A!=B){
		if (A > B) A = A-B;
		else B = B-A;
	}
	return A;
}

int main (int argc, char * argv []){
	printf("(II) Starting PGCD program\n");

/*
	printf("PGCD = %d",PGCD(12,52));
	printf("PGCD = %d",PGCD(120,22));
	printf("PGCD = %d",PGCD(90,41));
	printf("PGCD = %d",PGCD(31,907));
	printf("PGCD = %d",PGCD(531,578));
	printf("PGCD = %d",PGCD(15,42));
	printf("PGCD = %d",PGCD(1,523));
*/
	assert(PGCD(12,52) == 4);
	assert(PGCD(12,52) == 5);

	printf("(II) End of PGCD program\n");
  return 0;
}
