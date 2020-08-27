
DRIVERS = cdlink.sys
PROGS = cdstat.com admin.exe

DIST = C:\distro

all: $(PROGS) $(DRIVERS)

dist: $(PROGS) $(DRIVERS) cdlink.doc install.bat
	mkdir $(DIST)
	mkdir $(DIST)\cdrom
	copy cdlink.sys  $(DIST)\cdrom
	copy cdstat.com  $(DIST)\cdrom
	copy admin.exe   $(DIST)\cdrom
	copy cdlink.doc  $(DIST)\cdrom
	copy install.bat $(DIST)\cdrom

cdlink.obj: cdlink.asm cdlinkeq.inc cdlink.pub

%.pub: %.asm
	public $<

%.obj: %.asm
	masm $<,$@,,,\;

%.exe: %.obj
	link /m $<\;

%.sys %.com: %.exe
	exe2bin $< $@

.PHONY: all dist
