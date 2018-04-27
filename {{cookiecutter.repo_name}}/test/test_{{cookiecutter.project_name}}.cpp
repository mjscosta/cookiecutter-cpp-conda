#define CATCH_CONFIG_MAIN
#include "catch.hpp" 

TEST_CASE("{{ cookiecutter.project_name | capitalize }}Test", "[all]") {
    REQUIRE( 1 == 1 );
}
