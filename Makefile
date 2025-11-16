#       $OpenBSD: Makefile,v 1.6 2001/09/02 18:45:41 jakob Exp $

PROG=	nc
SRCS=	netcat.c atomicio.c socks.c

LIBS=  -lbsd -lresolv
OBJS=  $(SRCS:.c=.o)
CFLAGS=  -g -O2
LDFLAGS=  -Wl,--no-add-needed

all: nc
nc: $(OBJS)
	$(CC) $(CFLAGS) $(LDFLAGS) $(OBJS) $(LIBS) -o nc

$(OBJS): %.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

develop:
	sudo apt update
	sudo apt install -y libbsd-dev

clean:
	rm -f $(OBJS) nc
