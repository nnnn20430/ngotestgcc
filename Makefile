define SRCS :=
	ntofto/lib/ngotest.go
	ntofto/main.go
endef
OBJS := $(addprefix objs/, $(SRCS:.go=.o))
MAIN := ngotest

.PHONY: all clean $(MAIN)

all: $(MAIN)

clean:
	rm -rf objs/*

$(MAIN): $(OBJS)
	gccgo -static -o objs/$@ $^

objs/%.o: src/%.go
	@mkdir -p $(dir $@)
	gccgo -c -B objs -o $@ $^
