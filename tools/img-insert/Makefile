OUTPUT=img-insert

build:
	ocamlbuild \
		-use-ocamlfind \
		-pkg core \
		-tag "ppx(ppx-jane -as-ppx)" \
		-tag thread \
		-tag debug \
		-tag bin_annot \
		-tag short_paths \
		-cflags "-w A-4-33-40-41-42-43-34-44" \
		-cflags -strict-sequence \
		src/main.native
	rm -f ./main.native
	mv _build/src/main.native $(OUTPUT)

clean:
	rm -rf $(OUTPUT) _build static *.jpg *.png
