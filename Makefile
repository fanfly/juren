TEXFILES = $(wildcard src/*.tex)
OBJS = $(TEXFILES:src/%.tex=target/%.pdf)

.PHONY: all clean

all: $(OBJS)

target/%.pdf: build/%.pdf
	mkdir -p target
	cp $< $@

build/%.pdf: src/%.tex
	mkdir -p build
	cd src && latexmk -pdf -pdflatex='xelatex -halt-on-error' -outdir=../build $(notdir $<)

clean:
	rm -rf build target
