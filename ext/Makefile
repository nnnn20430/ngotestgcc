ifeq ($(origin CC), default)
CC = gcc
endif
CFLAGS ?= -Wall
INCLUDES ?= -Iinclude/
ifeq ($(origin ARFLAGS), default)
ARFLAGS = rcsv
endif
SRCS := $(shell find src -type f -name '*.c' -printf '%P\n')
OBJS := $(addprefix obj/, $(SRCS:.c=.o))
MAIN := ncgotest

.PHONY: all clean $(MAIN) FORCE

all: $(MAIN)

clean:
	rm -rf lib obj

$(MAIN): $(OBJS)
	@mkdir -p lib
	$(AR) $(ARFLAGS) lib/lib$(@).a $^

obj/%.o: src/%.c FORCE
	@mkdir -p $(dir $@)
	$(CC) $(CFLAGS) $(INCLUDES) -c -o $@ $<

FORCE:
