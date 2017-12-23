define PKGS :=
	ntofto/ngotestlib
	ntofto/ngotest/hello
	ntofto/ngotest
endef
OBJS := $(addprefix obj/, $(PKGS:%=%.o))
MAIN := ngotest

.PHONY: all clean $(MAIN) FORCE

all: $(MAIN)

clean:
	rm -rf bin obj

$(MAIN): $(OBJS)
	@mkdir -p bin
	gccgo -static -o bin/$@ $^

obj/%.o: src/% FORCE
	@mkdir -p $(dir $@)
	gccgo -I obj -c -o $@ $(wildcard $(<)/*.go)

FORCE:
