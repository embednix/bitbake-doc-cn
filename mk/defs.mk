# common commands
INKSCAPE = inkscape
PDFLATEX = xelatex
MKGLOSSARY = makeglossaries

# check version
INKSCAPE_IS_NEW = $(shell inkscape --version | grep -q "^Inkscape 1" && echo YES)
ifeq ($(INKSCAPE_IS_NEW),YES)
INKSCAPE_PDF_OPT = -o
else
INKSCAPE_PDF_OPT = -A
endif

# Output directory
OUTDIR   = $(shell pwd)/out

# common/ directory.
PDFLATEX_ENV = TEXINPUTS=.:$(shell pwd):$(shell pwd)/common: texfot --tee /tmp/fot.`id -u`

# Arguments passed to pdflatex
PDFLATEX_OPT = -shell-escape -file-line-error -halt-on-error
