all: help

help:
	@echo To increase dependability use struct instead of
	@echo expression on your SmPL rules. To show an example
	@echo issue run the following commands separately:
	@echo
	@echo -e "\tmake test1; git checkout -f\n"
	@echo
	@echo -e "\tmake test2; git checkout -f\n"

test1: netdev.c 0001-netdev_ops.cocci
	spatch --sp-file 0001-netdev_ops.cocci --in-place netdev.c 

test2: netdev.c 0001-netdev_ops.cocci
	spatch --sp-file 0001-netdev_ops-v2.cocci --in-place netdev.c 

netdev: netdev.c
	gcc -o netdev netdev.c

clean:
	rm -f netdev
