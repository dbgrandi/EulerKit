TARGETS = $(shell ls problem*.swift | cut -f 2 -d 'm' | cut -f 1 -d '.' | sort -g)
PRODUCTS = $(shell ls problem*[0-9])

all: $(TARGETS)
	
clean:
	rm $(PRODUCTS)

$(TARGETS):
	xcrun -sdk macosx swift -O3 problem$@.swift
