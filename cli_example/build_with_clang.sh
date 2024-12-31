set -ex 
OUTPUT=main.bin.clang
rm -rf $OUTPUT
CC=clang++
# Get the current GCC version
GCC_VERSION=$(gcc --version | grep -oP '\d+\.\d+\.\d+' | head -1)

# Set default compilation option
GCOV_VERSION_OPTION=""

# Determine the coverage option based on the GCC version
case "$GCC_VERSION" in
    "9.2.1")
        GCOV_VERSION_OPTION="-Xclang -coverage-version=A92A"
        ;;
    "9.4.0")
        GCOV_VERSION_OPTION="-Xclang -coverage-version=A94*"
        ;;
    "10.2.1")
        GCOV_VERSION_OPTION="-Xclang -coverage-version=B02A"
        ;;
    "11.4.0")
        GCOV_VERSION_OPTION="-Xclang -coverage-version=B14*"
        ;;
    "13.3.0")
        GCOV_VERSION_OPTION="-Xclang -coverage-version=B33*"
        ;;
    *)
        echo "Unsupported GCC version: $gcc_version"
        ;;
esac

COV_OPTION=--coverage

$CC main.cc -c -o main.o $COV_OPTION $GCOV_VERSION_OPTION

$CC main.o $COV_OPTION -o $OUTPUT

