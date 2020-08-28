OBJECTS = mosfront.obj mosliman.obj mosheman.obj mosint74.obj \
          mosddint.obj mosddcon.obj mosddblk.obj mosint21.obj \
          mosfun00.obj mosfun39.obj mosfutil.obj mostemp.obj  \
          mosfun0f.obj mosint13.obj mosdebug.obj mosmisc.obj \
          mosint10.obj mosint16.obj mosddtmc.obj mosinit.obj \
          mosint38.obj moscntxt.obj mosddblf.obj mosint28.obj \
          mosddclk.obj mosrtask.obj mosdevs.obj  mosint17.obj \
          mosfun01.obj mosmiman.obj mositask.obj mosint15.obj \
          mosfun44.obj mosfutl3.obj mosfutl2.obj mosfutl4.obj \
          mosint06.obj mossaver.obj mosnxtsk.obj

COMMON_INCLUDES = options.inc group.inc errcodes.inc macros.inc

KERNEL_INCLUDES = mosregs.inc mostcb.inc moscdb.inc mosbdb.inc mosscbex.inc \
                  mospsp.inc moslogo.inc moscnf.inc mboot.inc dskstruc.inc \
                  $(COMMON_INCLUDES)

MOSFUTIL_INCLUDES = mosregs.inc mostcb.inc moscdb.inc mosgfb.inc mostfb.inc \
                    mosrlb.inc mosbdb.inc mosscbex.inc $(COMMON_INCLUDES)

all:	$$$$rand.sys $$$$eval.sys

%.obj: %.asm
	masm $<,$@,,,\;

%.pub: %.asm
	public $<

%.pub: %.inc
	public $<

%.sys: %.exe
	copy $< $@
	debug $@ < exe2bin.dat

#==============================================================================
#	Build the R & D version of $$MOS.SYS
#==============================================================================
$$$$rand.exe: mosinit2.obj $(OBJECTS) mosback.obj
	$(file > $*.rsp)
	$(foreach O,$(OBJECTS) $< mosback,$(file >> $*.rsp,$(O:.obj= +)))
	link /m /se:512 @$*.rsp $@, $*.map\;
	del $*.rsp

mosinit2.obj: mosinit2.asm $(KERNEL_INCLUDES)

#==============================================================================
#	Build the RELEASE version of $$MOS.SYS
#	(called EVALUATION until registered)
#==============================================================================
$$$$eval.exe: mosini2e.obj $(OBJECTS) mosback.obj
	$(file > $*.rsp)
	$(foreach O,$(OBJECTS) $< mosback,$(file >> $*.rsp,$(O:.obj= +)))
	link /m /se:512 @$*.rsp $@, $*.map\;
	del $*.rsp

mosini2e.obj: mosinit2.asm $(KERNEL_INCLUDES)
	masm /DRELCODE=YES $<,$@,,,\;

#==============================================================================
#	Routines common to ALL versions of the MOS kernel.
#==============================================================================

mositask.obj: mositask.asm mostcb.inc moscdb.inc mosscbex.inc mosbdb.inc \
              mostcb.pub $(COMMON_INCLUDES)

mosfutil.obj: mosfutil.asm dskstruc.inc $(MOSFUTIL_INCLUDES)
mosfutl2.obj: mosfutl2.asm $(MOSFUTIL_INCLUDES)
mosfutl3.obj: mosfutl3.asm dskstruc.inc $(MOSFUTIL_INCLUDES)
mosfutl4.obj: mosfutl4.asm $(MOSFUTIL_INCLUDES)

mosfun39.obj: mosfun39.asm mosregs.inc mostcb.inc moscdb.inc mosgfb.inc \
              mostfb.inc mosrlb.inc mosbdb.inc mosscbex.inc mospsp.inc \
              $(COMMON_INCLUDES)

mosfun44.obj: mosfun44.asm mosregs.inc mostcb.inc moscdb.inc mosgfb.inc \
              mostfb.inc mosrlb.inc mosbdb.inc mosscbex.inc \
              $(COMMON_INCLUDES)

mosfun00.obj: mosfun00.asm mosregs.inc mostcb.inc moscdb.inc mostfb.inc \
              moxspldt.inc mospsp.inc mosbdb.inc mosscbex.inc \
              $(COMMON_INCLUDES)

mosfun01.obj: mosfun01.asm mosregs.inc mostcb.inc mostfb.inc mosscbex.inc \
              $(COMMON_INCLUDES)

mosfront.obj: mosfront.asm mostcb.inc mosscbdf.inc version.inc mboot.inc \
              dskstruc.inc $(COMMON_INCLUDES)

mosback.obj:  mosback.asm $(COMMON_INCLUDES)

mosmisc.obj:  mosmisc.asm mostcb.inc mosscbex.inc $(COMMON_INCLUDES)

mosheman.obj: mosheman.asm $(COMMON_INCLUDES)

mosliman.obj: mosliman.asm mostcb.inc moscdb.inc mosgfb.inc mosrlb.inc \
              mosbdb.inc mostfb.inc mosscbex.inc $(COMMON_INCLUDES)

mosrtask.obj: mosrtask.asm mosrtask.pub mosregs.inc mostcb.inc moscdb.inc \
              mosgfb.inc mostfb.inc mosrlb.inc mosscbex.inc $(COMMON_INCLUDES)

mosmiman.obj: mosmiman.asm mostcb.inc moscdb.inc mosgfb.inc mostfb.inc \
              mosrlb.inc mosbdb.inc mosscbex.inc $(COMMON_INCLUDES)

mosint06.obj: mosint06.asm mosregs.inc mostcb.inc mosscbex.inc $(COMMON_INCLUDES)

mosint10.obj: mosint10.asm mosregs.inc mostcb.inc mosscbex.inc $(COMMON_INCLUDES)

mosint16.obj: mosint16.asm mosregs.inc mostcb.inc mosscbex.inc $(COMMON_INCLUDES)

mosint17.obj: mosint17.asm mosint17.pub mosscbex.inc mostcb.inc moxspldt.inc \
              $(COMMON_INCLUDES)

mosint28.obj: mosint28.asm mosregs.inc mostcb.inc mosscbex.inc $(COMMON_INCLUDES)

mosddtmc.obj: mosddtmc.asm mosddtmc.pub mosregs.inc mostcb.inc mosscbex.inc \
              $(COMMON_INCLUDES)

mosint15.obj: mosint15.asm mosint15.pub mosregs.inc mostcb.inc mosscbex.inc \
              $(COMMON_INCLUDES)

mosnxtsk.obj: mosnxtsk.asm mosregs.inc mostcb.inc mosscbex.inc $(COMMON_INCLUDES)

mosint74.obj: mosint74.asm mosint74.pub mosregs.inc mostcb.inc mosscbex.inc \
              $(COMMON_INCLUDES)

moscntxt.obj: moscntxt.asm mostcb.inc mosscbex.inc $(COMMON_INCLUDES)

mosddblk.obj: mosddblk.asm mosddblk.pub dskstruc.inc $(COMMON_INCLUDES)

mosddclk.obj: mosddclk.asm mosscbex.inc mostcb.inc $(COMMON_INCLUDES)

mosddblf.obj: mosddblf.asm dskstruc.inc $(COMMON_INCLUDES)

mosdevs.obj:  mosdevs.asm mosdevs.pub mostcb.inc $(COMMON_INCLUDES)

mosddint.obj: mosddint.asm mosregs.inc mostcb.inc moscdb.inc mosbdb.inc \
              mosscbex.inc dskstruc.inc $(COMMON_INCLUDES)

mosdebug.obj: mosdebug.asm mosregs.inc mosscbex.inc mostcb.inc $(COMMON_INCLUDES)

mosint21.obj: mosint21.asm mosregs.inc mostcb.inc mosbdb.inc mosscbex.inc \
              $(COMMON_INCLUDES)

mosddcon.obj: mosddcon.asm mostcb.inc $(COMMON_INCLUDES)

mosint13.obj: mosint13.asm mosint13.pub mosscbex.inc mosregs.inc mostcb.inc \
              $(COMMON_INCLUDES)

mossaver.obj: mossaver.asm mossaver.pub mosregs.inc mostcb.inc mosscbex.inc \
              $(COMMON_INCLUDES)

mosfun0f.obj: mosfun0f.asm mosregs.inc mostcb.inc moscdb.inc mosgfb.inc \
              mostfb.inc mosrlb.inc mosbdb.inc mosscbex.inc $(COMMON_INCLUDES)

mosint38.obj: mosint38.asm mosregs.inc mostfb.inc mosgfb.inc mostcb.inc \
              mosscbex.inc moscdb.inc mosbdb.inc $(COMMON_INCLUDES)

mostemp.obj:  mostemp.asm mosregs.inc mostcb.inc moscdb.inc mosgfb.inc \
              mostfb.inc mosrlb.inc mosbdb.inc mosscbex.inc dskstruc.inc \
              $(COMMON_INCLUDES)

mosinit.obj:  mosinit.asm mosregs.inc mosscbex.inc mostcb.inc moscnf.inc \
              $(COMMON_INCLUDES)

clean:
	-del *.map
	-del *.sys
	-del *.obj

.PHONY: all clean
.SUFFIXES: .sys .obj .exe
