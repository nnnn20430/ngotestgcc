define SRCS :=
	ntofto/ngotestlib/strings.go
endef
OBJS := $(addprefix obj/, $(SRCS:.go=.o))
MAIN := ngotestlib

.PHONY: all clean $(MAIN) FORCE

all: $(MAIN)

clean:
	rm -rf $(wildcard lib/* obj/*)

$(MAIN): $(OBJS)
	@mkdir -p lib
	ar rcs lib/lib$(@).a $^

obj/%.o: src/%.go FORCE
	@mkdir -p $(dir $@)
	gccgo -B obj -c -o $@ $<

FORCE:
