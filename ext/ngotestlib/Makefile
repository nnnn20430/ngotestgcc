ifeq ($(origin ARFLAGS), default)
ARFLAGS = rcsv
endif
define PKGS :=
	ntofto/ngotestlib
endef
OBJS := $(addprefix obj/, $(PKGS:%=%.o))
MAIN := ngotestlib

.NOTPARALLEL:

.PHONY: all clean $(MAIN) FORCE

all: $(MAIN)

clean:
	rm -rf lib obj include

$(MAIN): $(OBJS)
	@mkdir -p lib
	$(AR) $(ARFLAGS) lib/lib$(@).a $^

obj/%.o: src/% FORCE
	@mkdir -p $(dir $@) $(dir $(@:obj/%=include/%))
	gccgo -I obj -c -o $@ $(wildcard $(<)/*.go)
	objcopy -j .go_export $@ $(patsubst %.o,%.gox,$(@:obj/%=include/%))

FORCE:
