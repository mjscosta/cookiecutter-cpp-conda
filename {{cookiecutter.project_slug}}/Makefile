# Build all targets
all: configure
	@ cmake --build build --target all

# Build the documentation (Doxygen)
doc: configure
	@ make doc -C build

# Build all targets and run the test suite
test: configure
	@ cmake --build build --target license_manager_test
	@ cmake --build build --target test

# Build and install all targets
install: all
	@ cmake --build build --target install

# Configure the targets (CMake)
configure: install_deps
	@ cd build && cmake ..

# Install dependencies
install_deps: build/conanbuildinfo.cmake

build/conanbuildinfo.cmake: conanfile.txt
	@ cd build && conan install .. 

# Clean the build directory
clean:
	@ rm -rf build && mkdir build

# Format all h,hpp,c,cpp,cxx files under version control inplace
format:
	@ { git diff --name-only --diff-filter=ACMRT; \
	    git diff --name-only --diff-filter=ACRMT --cached; } | \
	  grep -E "\.(c|h|cpp|hpp|cxx)$$" | \
	  xargs -n1 clang-format -i

# Check for formatting violations without fixing
check-format:
	@ ! { git diff --name-only --diff-filter=ACMRT; \
	      git diff --name-only --diff-filter=ACMRT --cached; } | \
	    grep -E "\.(c|h|cpp|hpp|cxx)$$" | \
	    xargs -n1 clang-format -output-replacements-xml | \
	    grep "<replacement " > /dev/null
