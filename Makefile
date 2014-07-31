TARGETS = $(shell ls problem*.swift | cut -f 2 -d 'm' | cut -f 1 -d '.')

all: $(TARGETS)

$(TARGETS):
	xcrun -sdk macosx swift -O3 problem$@.swift

