#include "pgcd.hpp"
#define CATCH_CONFIG_MAIN  // This tells Catch to provide a main() - only do this in one cpp file
#include "catch.hpp"

TEST_CASE( "Fonctionnement normal", "[PGCD]" ) {
	SECTION("A > B"){
		 REQUIRE( PGCD(1250,570) == 10 );
		 REQUIRE( PGCD(5616,1248)== 624);
		 REQUIRE( PGCD(247,57)   == 19 );
		 REQUIRE( PGCD(14796,2366)== 2 );
	}
	SECTION("A < B"){
		 REQUIRE( PGCD(6580,9896) == 4 );
		 REQUIRE( PGCD(560,5348)  == 28);
		 REQUIRE( PGCD(24,896)    == 8 );
		 REQUIRE( PGCD(780,9864)  == 12);
	}
	SECTION ("A = B"){
		REQUIRE( PGCD(8640,8640) == 8640);
		REQUIRE( PGCD(347,347)   == 347 );
		REQUIRE( PGCD(6270,6270) == 6270);
		REQUIRE( PGCD(12,12)     == 12  );
	}
}
TEST_CASE( "Cas particulier", "[PGCD]" ) {
	SECTION("A > B"){
		 REQUIRE( PGCD(35365,570) == 5   );
		 REQUIRE( PGCD(5616,0)    == 5616);
	}
	SECTION("A < B"){
		 REQUIRE( PGCD(0,9896)    == 9896 );
		 REQUIRE( PGCD(5605,35365)== 5    );
	}
	SECTION ("A = B"){
		REQUIRE( PGCD(0,0)         == 0    );
		REQUIRE( PGCD(35365,35365) == 35365);

	}
}
