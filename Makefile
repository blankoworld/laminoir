#!/usr/bin/env make -f
#
# Makefile
#
#

# DEBUG mode: Do `Q= make` to enter DEBUG mode
Q ?= @

# VARIABLES
NAME ?= final
# Document formats: html pdf
DOC_FORMAT ?= html
# Today
DATE ?= $(date +%d/%m/%Y)
SRC_DIR ?= ./content/
CONTENT_LIST := $(shell find ${SRC_DIR} -type f -iname '*.md')
# Highlight theme: Cf. `pandoc --list-highlight-styles`
# tango
# pygments
# kate
# monochrome
# espresso
# zenburn
# haddock
# breezedark
HL_THEME ?= kate
TOC_TITLE ?= Sommaire

# Specific to PDF
FONT_FAMILY ?= utopia
FONT_SIZE ?= 11pt
LATEX_TEMPLATE ?= templates/default.latex

# START
default: public/${NAME}.${DOC_FORMAT}

public:
	$Qmkdir public

public/${NAME}.html: public ${CONTENT_LIST}
	$Qecho "[PREPA] HTML      : contenu"
	$Qpandoc -s --toc -V toc-title:'${TOC_TITLE}' --from=markdown+raw_attribute --highlight-style ${HL_THEME} --to=html -o "public/${NAME}.html" ${CONTENT_LIST}

public/${NAME}.pdf: public ${CONTENT_LIST}
	$Qecho "[PREPA] PDF       : contenu"
	$Qpandoc -V colorlinks -V fontfamily="${FONT_FAMILY}" -V fontsize="${FONT_SIZE}" -V classoption:twoside --number-sections -V graphics --template="${LATEX_TEMPLATE}" --toc -V toc-title:'${TOC_TITLE}' -V papersize:a4 --from=markdown --to=latex -o "public/${NAME}.pdf" ${CONTENT_LIST}

# END
.PHONY: clean

clean:
	$Qrm -rf public
