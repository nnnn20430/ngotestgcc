define SRCS :=
	ntofto/ngotest/lib/ngotest.go
	ntofto/ngotest/main.go
endef
OBJS := $(addprefix obj/, $(SRCS:.go=.o))
MAIN := ngotest

.PHONY: all clean ext $(MAIN) FORCE

all: ext $(MAIN)

clean:
	rm -rf $(wildcard bin/* obj/*)
	@$(MAKE) -C ext clean

ext:
	@$(MAKE) -C ext

$(MAIN): $(OBJS)
	@mkdir -p bin
	gccgo -static -o bin/$@ $^ $(wildcard ext/lib/*.a)

obj/%.o: src/%.go FORCE
	@mkdir -p $(dir $@)
	gccgo -B ext/lib -B obj -c -o $@ $<

FORCE:
