SERVICES  ?= $(wildcard amazonka-*)
LIBRARIES ?= core amazonka test $(SERVICES)
FORWARD   := sdist upload upload-docs

build:
	stack build --fast \
	--extra-include-dirs=/usr/local/Cellar/icu4c/58.1/include \
	--extra-lib-dirs=/usr/local/Cellar/icu4c/58.1/lib

clean:
	stack clean

define forward
$1: $$(addprefix $1-,$$(LIBRARIES))

$1-%:
	@make -C $$* $1

.PHONY: $1
endef

$(foreach c,$(FORWARD),$(eval $(call forward, $c)))

.PHONY: $(LIBRARIES)

amazonka:
	stack build --fast amazonka

core:
	stack build --fast amazonka-core

$(SERVICES):
	stack build --fast $@
