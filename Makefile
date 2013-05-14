# Makefile for Broadcom TG3 driver (TG3)
DRIVER = tg3

# directories
u = /usr
i = $u/include

# programs, flags, etc.
#CC = exec cc -Wall
CC = exec /usr/gnu/bin/gcc -O2 -Wall -ggdb3 -fno-strict-aliasing -fno-builtin -Wfatal-errors
CFLAGS = -I$i $(CPROFILE)
LDFLAGS = -i 
LIBS = -lnetdriver -lsys -ltimers

OBJ = tg3.o

# build local binary
all build:	$(DRIVER)
$(DRIVER):	$(OBJ) 
	$(CC) -o $@ $(LDFLAGS) $(OBJ) $(LIBS)
	install -S 128k $(DRIVER)

# install with other drivers
install:	/usr/sbin/$(DRIVER)
/usr/sbin/$(DRIVER):	$(DRIVER)
	install -o root -c $? $@

# clean up local files
clean:
	rm -f *.o *.bak $(DRIVER)
