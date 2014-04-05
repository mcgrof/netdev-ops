#include <stdlib.h>

struct net_device_ops {
};

struct net_device {
	struct net_device_ops *netdev_ops;
};

struct bubble_ops {
};

struct bubbles {
	struct bubble_ops *netdev_ops;
};

static struct net_device_ops my_netdev_ops = {
};

static struct bubble_ops my_bubble_ops = {
};

static struct parent {
	struct net_device *dev;
	int b;
};

static struct parent_usb {
	struct net_device *net;
	int b;
};

int main(void)
{
	struct parent *p = malloc(sizeof(struct parent));
	struct parent_usb *p_usb = malloc(sizeof(struct parent));
	struct net_device *dev = malloc(sizeof(struct net_device));
	struct bubbles *bubble = malloc(sizeof(struct bubbles));

	dev->netdev_ops = &my_netdev_ops;
	bubble->netdev_ops = &my_bubble_ops;

	free(dev);
	free(bubble);
	free(p);
	free(p_usb);

	p->dev = dev;
	p->dev->netdev_ops = &my_netdev_ops;
	p_usb->net->netdev_ops = &my_netdev_ops;

	return 0;
}

