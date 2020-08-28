
PROG = export.exe

OBJECTS = export.obj parse.obj get_next.obj output.obj compress.obj \
          init_drv.obj term.obj  mos_util.obj globals.obj

OBJLIST = export +parse +output +get_next +compress +init_drv \
          +term +mos_util +globals

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
