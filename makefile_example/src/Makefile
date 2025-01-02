all: main

CFLAGS = --coverage

ifeq ($(shell $(CC) --version | grep "clang"),)
    CC = gcc
else
    CC = clang
	GCC_VERSION := $(shell gcc --version | grep -oP '\d+\.\d+\.\d+' | head -1)
	GCOV_VERSION_OPTION := ""
ifeq ($(GCC_VERSION), 8.3.0)
    GCOV_VERSION_OPTION := -Xclang -coverage-version=A83*
else ifeq ($(GCC_VERSION), 9.2.1)
    GCOV_VERSION_OPTION := -Xclang -coverage-version=A92A
else ifeq ($(GCC_VERSION), 9.4.0)
    GCOV_VERSION_OPTION := -Xclang -coverage-version=A94*
else ifeq ($(GCC_VERSION), 10.2.1)
    GCOV_VERSION_OPTION := -Xclang -coverage-version=B02A
else ifeq ($(GCC_VERSION), 11.4.0)
    GCOV_VERSION_OPTION := -Xclang -coverage-version=B14*
else ifeq ($(GCC_VERSION), 13.3.0)
    GCOV_VERSION_OPTION := -Xclang -coverage-version=B33*
else
    $(echo Unsupported GCC version: $(GCC_VERSION))
endif
	CFLAGS += $(GCOV_VERSION_OPTION)
endif



%: %.o
	$(CC) $(CFLAGS) $^ $(LDFLAGS) $(LDFLAGS_EX) $(LIBS) -o $@$(X)

main.o: main.c

main: main.o
	$(CC) $(CFLAGS) $^ -o main.bin.$(CC)

clean:
	rm -rf *.o main.bin.* *.gcno *.gcda
