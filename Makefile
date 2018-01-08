define PKGS :=
	ntofto/ngotestlib
	ntofto/ngotest/hello
	ntofto/ngotest
endef
OBJS := $(addprefix obj/, $(PKGS:%=%.o))
MAIN := ngotest

.NOTPARALLEL:

.PHONY: all clean ext $(MAIN) FORCE

all: ext $(MAIN)

clean:
	rm -rf bin obj
	@$(MAKE) -C ext clean

ext:
	@$(MAKE) -C ext

$(MAIN): $(OBJS)
	@mkdir -p bin
	gccgo -static -o bin/$@ $^ $(wildcard ext/lib/*.a)

obj/%.o: src/% FORCE
	@mkdir -p $(dir $@)
	gccgo -I obj -c -o $@ $(wildcard $(<)/*.go)

FORCE:
