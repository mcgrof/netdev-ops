all: netdev

test1: netdev.c 0001-netdev_ops.cocci
	spatch --sp-file 0001-netdev_ops.cocci --in-place netdev.c 

test2: netdev.c 0001-netdev_ops.cocci
	spatch --sp-file 0001-netdev_ops-v2.cocci --in-place netdev.c 

netdev: netdev.c
	gcc -o netdev netdev.c

clean:
	rm -f netdev
