BREW_LIB:=$(shell brew --prefix)

all: log2callgrind

log2callgrind: *.ml
	ocamlfind ocamlopt -ccopt -L$(BREW_LIB)/lib -linkpkg -thread -package str Callgrind.ml ZshXtrace.ml ZshXtraceToCallgrind.ml -o log2callgrind

.PHONY: clean
clean:
	rm log2callgrind *.cmi *.cmx *.o || true
