ifeq (y,$(ECHO))
BASH_FLAGS := -x
else ifeq (y,$(DEBUG))
BASH_FLAGS := -x
MAKEFLAGSADD := -d
endif
BASH_FLAGS += -c

