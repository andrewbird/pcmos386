
PROG = import.exe

OBJECTS = import.obj parse.obj decomp.obj get_next.obj term.obj \
          mos_util.obj globals.obj
OBJLIST = import +parse +decomp +get_next +term +mos_util +globals

DIST = C:\distro

all: $(PROG)

dist: $(PROG)
	copy $(PROG) $(DIST)

$(PROG): $(OBJECTS)
	link $(OBJLIST) /e,,,rsasmall

%.obj: %.asm
	masm -Mx $<,$@,,,\;

%.obj: %.c
	$(SHELL) /c loadfix cl -c $<

.PHONY: all dist
