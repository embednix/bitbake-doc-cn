# common commands
PDFLATEX = xelatex
MKGLOSSARY = makeglossaries

# Output directory
OUTDIR   = $(shell pwd)/out

# common/ directory.
PDFLATEX_ENV = TEXINPUTS=.:$(shell pwd):$(shell pwd)/common: texfot --tee /tmp/fot.`id -u`

# Arguments passed to pdflatex
PDFLATEX_OPT = -shell-escape -file-line-error -halt-on-error
