package hello

import _ "unsafe"

//go:linkname c_ncgotest_hello ncgotest_hello
func c_ncgotest_hello()

//go:linkname c_ncgotest_newline ncgotest_newline
func c_ncgotest_newline()

func init() {
	c_ncgotest_hello()
	c_ncgotest_newline()
}
