TARGETS = $(shell ls problem*.swift | cut -f 2 -d 'm' | cut -f 1 -d '.' | sort -g)
PRODUCTS = $(shell ls problem*[0-9] 2> /dev/null )

all: $(TARGETS)
	
clean:
	rm -f $(PRODUCTS)

$(TARGETS):
	xcrun -sdk macosx swiftc -Ounchecked problem$@.swift
