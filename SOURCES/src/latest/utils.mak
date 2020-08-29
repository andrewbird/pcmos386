.SUFFIX: .asm .obj .exe .com .sys

all: pgms dvrs kbds $$$$shell.sys

verschk.inc: version.inc

adddev.obj:  adddev.asm adddev.pub page.inc options.inc macros.inc version.inc

addtask.obj: addtask.asm addtask.pub page.inc options.inc mostcb.inc mosscbdf.inc \
             version.inc macros.inc

moxutil.obj: moxutil.asm moxutl.inc
alias.obj:   alias.asm alias.pub page.inc moxutl.inc version.inc
alias.exe:   alias.obj moxutil.obj
	link alias + moxutil \;

class.obj: class.asm class.pub page.inc mostcb.inc mosscbdf.inc options.inc version.inc


#******************************************************************************
#       MOS Debugger.
#******************************************************************************
DEBUGOBJS = debug.obj debugman.obj debugcon.obj debugext.obj \
            debugtra.obj debugsup.obj debugend.obj

debugman.obj: debugman.asm debugman.pub page.inc debugmac.inc
debugcon.obj: debugcon.asm debugcon.pub page.inc
debugext.obj: debugext.asm debugext.pub page.inc
debugtra.obj: debugtra.asm debugtra.pub page.inc debugmac.inc
debugsup.obj: debugsup.asm debugsup.pub page.inc
debugend.obj: debugend.asm debugend.pub page.inc
debug.obj:    debug.asm debug.pub page.inc options.inc mostcb.inc mostcb.pub version.inc
debug.exe:    $(DEBUGOBJS)
	link debug +debugman +debugcon +debugext +debugtra +debugsup +debugend/m \;

#******************************************************************************

COMMON_INCLUDES = version.inc options.inc

dirmap.obj:   dirmap.asm dirmap.pub page.inc $(COMMON_INCLUDES)

diskcopy.obj: diskcopy.asm diskcopy.pub page.inc copyrit.inc verschk.inc

diskid.obj:   diskid.asm page.inc verschk.inc

filemode.obj: filemode.asm filemode.pub page.inc version.inc

filter.obj:   filter.asm filter.pub page.inc

format.obj:   format.asm format.pub page.inc options.inc dskstruc.inc \
              mboot.inc mboot.pub macros.inc fmcommon.inc

hdsetup.obj:  hdsetup.asm hdsetup.pub page.inc mbrdef.inc mbr.inc

keymap.obj:   keymap.asm page.inc

minbrdpc.obj: minbrdpc.asm minbrdpc.pub page.inc

mispeed.obj:  mispeed.asm mispeed.pub page.inc

monitor.obj:  monitor.asm mostfb.inc mosscbdf.inc mostcb.inc page.inc \
              $(COMMON_INCLUDES)

more.obj:     more.asm page.inc version.inc

mos.obj:      mos.asm mos.pub mostcb.inc mosscbdf.inc mostfb.inc \
              genmouse.inc moxmos.inc macros.inc $(COMMON_INCLUDES)

mosadm.obj:   mosadm.asm mosadm.pub page.inc mostcb.inc mosscbdf.inc mostfb.inc \
              genmouse.inc moxmos.inc $(COMMON_INCLUDES)

mosdd7f.obj:  mosdd7f.asm options.inc

moxcptsk.obj: moxcptsk.asm page.inc mosscbdf.inc

msys.obj:     msys.asm msys.pub page.inc mboot.inc dskstruc.inc macros.inc \
              fmcommon.inc

netname.obj:  netname.asm netname.pub page.inc version.inc

patchid.obj:  patchid.asm patchid.pub page.inc macros.inc

_osmos.def:   ismos.def
	copy $< $@

print.obj:    print.asm print.pub _osmos.def page.inc options.inc copyrit.inc

remdev.obj:   remdev.asm remdev.pub page.inc options.inc

remtask.obj:  remtask.asm remtask.pub page.inc mostcb.inc mosscbdf.inc \
              moxutl.inc version.inc
remtask.exe:  remtask.obj moxutil.obj
	link remtask + moxutil \;

search.obj:   search.asm search.pub page.inc version.inc

serinfo.obj:  serinfo.asm

setmouse.obj: setmouse.asm page.inc

spool.obj:    spool.asm page.inc options.inc mostcb.inc copyrit.inc verschk.inc

verify.obj:   verify.asm verify.pub page.inc options.inc macros.inc dskstruc.inc

init.obj:     init.asm init.pub

pgms:         adddev.com addtask.com dirmap.com alias.com class.com debug.com \
              dirmap.com diskcopy.com diskid.com filemode.com \
              format.com hdsetup.com keymap.com monitor.com serinfo.com \
              more.com mos.com mosadm.com mosdd7f.sys moxcptsk.com msys.com \
              netname.com print.com remdev.com remtask.com search.com \
              setmouse.com spool.com verify.exe init.com filter.com patchid.com \
              mispeed.com compfile.exe helpgen.exe

# Keyboards

$$k%.obj: mosk%.asm page.inc moskbfor.inc moskbinz.inc
	masm $<, $@ \;

kbds: $$kbbe.sys $$kbcf.sys $$kbdk.sys $$kbfr.sys $$kbgr.sys $$kbit.sys \
      $$kbla.sys $$kbnl.sys $$kbno.sys $$kbpo.sys $$kbsf.sys $$kbsg.sys \
      $$kbsp.sys $$kbsv.sys $$kbuk.sys

# Drivers

_286n.obj: _286n.asm page.inc

_386.obj: _386.asm page.inc

_all.obj: _all.asm page.inc moxmem.inc

_charge.obj: _charge.asm page.inc moxmem.inc

_ems.obj: _ems.asm _ems.pub page.inc

_gizmo.obj: _gizmo.asm page.inc moxmem.inc

_mouse.obj: _mouse.asm _mouse.pub page.inc options.inc mosregs.inc xifmacs.inc \
            mostcb.inc mosscbdf.inc genmouse.inc

_netbios.obj: _netbios.asm _netbios.pub page.inc options.inc mostcb.inc mosscbdf.inc

_pipe.obj: _pipe.asm _pipe.pub page.inc mosscbdf.inc options.inc devreqh.inc

_ramdisk.obj: _ramdisk.asm page.inc

_arnet.obj: _arnet.asm _arnet.pub page.inc options.inc jmpmacro.inc

_serial.obj: _serial.asm _serial.pub page.inc options.inc serial.def jmpmacro.inc \
             seriomac.inc int14.inc isrsub.inc pilds.inc llrec.inc
	masm /DSERIALDEF=serial.def $<, $@ \;

# LINK objfiles [, [exefile] [, [mapfile] [, [libraries] [, [deffile] ] ] ] ][;]
$$%.exe: _%.obj
	link $<,$@,,,\;

dvrs:  $$286n.sys $$386.sys $$all.sys $$charge.sys $$ems.sys $$gizmo.sys \
       $$mouse.sys $$netbios.sys $$pipe.sys $$ramdisk.sys $$arnet.sys \
       $$serial.sys minbrdpc.sys

#******************************************************************************
#       MOS Command processor - $$shell.sys
#******************************************************************************

SHELLOBJS = moxcpcor.obj moxcpint.obj moxcppls.obj moxcpsub.obj

moxcpcor.obj: moxcpcor.asm moxcpcor.pub options.inc moxcpdat.inc moxcpdat.pub \
              mostcb.inc moxcpsxt.inc mosscbex.inc version.inc
	copy moxcpcor.pub + moxcpdat.pub moxcpcor.pub
	masm moxcpcor \;

moxcpint.obj: moxcpint.asm moxcpint.pub moxcpdat.inc moxcpsxt.inc

moxcppls.obj: moxcppls.asm moxcppls.pub page.inc moxcpdat.inc mosscbdf.inc moxcpsxt.inc

moxcpsub.obj: moxcpsub.asm moxcpsub.pub page.inc moxcpdat.inc mosscbex.inc mostcb.inc

$$$$shell.exe: $(SHELLOBJS)
	link $^,$@,,,\;

#
#  Utility programs written in C.  (And Pascal, temporarily)
#
compfile.exe: compfile.obj
	link $</e,,,rsasmall

helpgen.exe: helpgen.obj
	link $</e,,,rsasmall

help.exe: help.pas help.inc
	tpc help

#
# General rules
#
%.obj: %.asm
	masm $<,$@,,,\;

%.obj: %.c
	$(SHELL) /c loadfix cl -c $<

%.pub: %.asm
	public $<

%.pub: %.inc
	public $<

%.exe: %.obj
	link $* \;

%.sys %.com: %.exe
	exe2bin $< $@

.PHONY: pgms dvrs kbds
.INTERMEDIATE: $(DEBUGOBJS) $(SHELLOBJS)
