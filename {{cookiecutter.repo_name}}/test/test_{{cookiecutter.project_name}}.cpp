#define CATCH_CONFIG_MAIN
#include "catch.h" 

TEST("{{ cookiecutter.project_name | capitalize }}Test", "[all]") {
    REQUIRE( 1 == 1 );
}
