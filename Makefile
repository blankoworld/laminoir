#!/usr/bin/env make -f
#
# Makefile
#
#

# DEBUG mode: Do `Q= make` to enter DEBUG mode
Q ?= @

# VARIABLES
NAME ?= final
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

# START
default: final

public:
	$Qmkdir public

html: public ${CONTENT_LIST}
	$Qecho "[PREPA] HTML      : contenu"
	$Qpandoc -s --from=markdown+raw_attribute --highlight-style ${HL_THEME} --to=html -o "public/${NAME}.html" ${CONTENT_LIST}

final: ${DOC_FORMAT}

# END
.PHONY: clean

clean:
	$Qrm -rf public
