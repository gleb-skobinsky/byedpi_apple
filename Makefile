TARGET = bin/libciadpi.a

CPPFLAGS = -D_DEFAULT_SOURCE
CFLAGS += -I. -std=c99 -O2 -Wall -Wno-unused -Wextra -Wno-unused-parameter -pedantic

HEADERS = conev.h desync.h error.h extend.h kavl.h mpool.h packets.h params.h proxy.h win_service.h
SRC = packets.c conev.c proxy.c desync.c mpool.c extend.c

OBJ = $(SRC:.c=.o)

PREFIX := /usr/local
INSTALL_DIR := $(DESTDIR)$(PREFIX)/lib/

all: static

static: $(TARGET)

$(TARGET): $(OBJ)
	ar rcs $(TARGET) $(OBJ)

$(OBJ): $(HEADERS)

.c.o:
	$(CC) $(CPPFLAGS) $(CFLAGS) -c $< -o $@

clean:
	rm -f $(TARGET) $(OBJ)

install: $(TARGET)
	mkdir -p $(INSTALL_DIR)
	install -m 644 $(TARGET) $(INSTALL_DIR)
