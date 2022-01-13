CC ?= gcc

can_fmc_loopback: can_fmc_loopback.c
	$(CC) -o can_fmc_loopback can_fmc_loopback.c -lpthread -Wall -Werror -Wpedantic

clean:
	rm -rf can_fmc_loopback .*.swp .*.un* *~
