# General make configuration
MAKEFLAGS += --warn-undefined-variables
SHELL := bash
.DEFAULT_GOAL := all

# Project metadata
PROJECT_NAME=dissertation

# Project build configuration
TEX := pdflatex -shell-escape -interaction=nonstopmode -file-line-error -synctex=1


.PHONY: all
all: $(PROJECT_NAME).pdf

.PHONY: view
view: $(PROJECT_NAME).pdf
	@xdg-open $(PROJECT_NAME).pdf

$(PROJECT_NAME).pdf: $(PROJECT_NAME).tex
	@latexmk -pdf -pdflatex="$(TEX)" -bibtex -use-make $<

.PHONY: clean
clean:
	@latexmk -c
	@rm -rf _minted-$(PROJECT_NAME)/

.PHONY: clobber
clobber: clean
	@latexmk -C -bibtex
