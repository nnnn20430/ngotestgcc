.PHONY: all clean ncgotest ngotestlib FORCE

all: build_ncgotest build_ngotestlib
	@mkdir lib
	ln -s ../ncgotest/lib/libncgotest.a lib/libncgotest.a
	ln -s ../ngotestlib/lib/libngotestlib.a lib/libngotestlib.a
	ln -nfs ngotestlib/include include

clean: clean_ncgotest clean_ngotestlib
	rm -rf lib include

build_%:
	@$(MAKE) -C $(@:build_%=%)

clean_%:
	@$(MAKE) -C $(@:clean_%=%) clean
