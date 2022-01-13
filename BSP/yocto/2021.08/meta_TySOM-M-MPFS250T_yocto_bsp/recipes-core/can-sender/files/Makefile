CC ?= gcc

can_sender: can_sender.c
	$(CC) -o can_sender can_sender.c -lpthread -Wall -Werror -Wpedantic

clean:
	rm -rf can_sender .*.swp .*.un* *~
