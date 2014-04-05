all: netdev

netdev: netdev.c
	gcc -o netdev netdev.c

clean:
	rm -f netdev
