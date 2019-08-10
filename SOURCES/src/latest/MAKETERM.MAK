#######################################################################
#
# makefile for:		terminal drivers
#
# creation date:	12/20/89
#
# revision date:	3/12/91
#
#---------------------  >> revision log <<  --------------------------
#
# sah 04/06/90	added view.sys (viewport)
#
# sah 07/17/90	added unterm.sys (amr egna, vna+)
#
# mjs 08/13/90	make view.sys, unterm.sys, vgna.sys
#		and srterm.sys dependent on vidchk.inc
#
# bwr 03/12/91	added swterm.sys (for sherwood terminals)
#
# mjs 05/24/91	removed xif dependency from vgna.asm and ddtvna.asm
# 
# cbk 07/29/91	added w7term.sys (for wyse 370 color terminal)
#
# cbk 8/22/91 	added trterm.sys (for relisys tr-170)
# 
# SAH 09/11/91  added bios*.inc for unterm.sys
#
# cbk 11/11/91 	added a1term.sys (for AT&T 615)
#
# cbk 06/22/92  added v4term.sys for DEC VT420
#
#######################################################################

all:	19term.sys  31term.sys  3aterm.sys  52term.sys  anterm.sys \
	atterm.sys  avterm.sys  elterm.sys  exterm.sys  pcterm.sys \
	srterm.sys  t1term.sys  ttterm.sys  tvterm.sys  vgna.sys \
	vna.sys     wy99gt.sys  view.sys    swterm.sys \
	w7term.sys  trterm.sys  a1term.sys  v4term.sys #unterm.sys


19term.sys:	moxddtgn.asm  page.inc  macros.inc  19def.inc
        public moxddtgn
        masm /DTERMDEF=19def.inc moxddtgn,$*;
        del moxddtgn.pub
        link $*;
        del $*.obj
        exe2bin $* $*.sys
        del $*.exe

31term.sys:	moxddtgn.asm  page.inc  macros.inc  31def.inc
        public moxddtgn
        masm /DTERMDEF=31def.inc moxddtgn,$*;
        del moxddtgn.pub
        link $*;
        del $*.obj
        exe2bin $* $*.sys
        del $*.exe

3aterm.sys:	moxddtgn.asm  page.inc  macros.inc  3adef.inc
        public moxddtgn
        masm /DTERMDEF=3adef.inc moxddtgn,$*;
        del moxddtgn.pub
        link $*;
        del $*.obj
        exe2bin $* $*.sys
        del $*.exe
        
52term.sys:	moxddtgn.asm  page.inc  macros.inc  52def.inc
        public moxddtgn
        masm /DTERMDEF=52def.inc moxddtgn,$*;
        del moxddtgn.pub
        link $*;
        del $*.obj
        exe2bin $* $*.sys
        del $*.exe

a1term.sys:	moxddtgn.asm  page.inc  macros.inc  a1def.inc
        public moxddtgn
        masm /DTERMDEF=a1def.inc moxddtgn,$*;
        del moxddtgn.pub
        link $*;
        del $*.obj
        exe2bin $* $*.sys
        del $*.exe

anterm.sys:	moxddtgn.asm  page.inc  macros.inc  andef.inc
        public moxddtgn
        masm /DTERMDEF=andef.inc moxddtgn,$*;
        del moxddtgn.pub
        link $*;
        del $*.obj
        exe2bin $* $*.sys
        del $*.exe

atterm.sys:	mosddtsh.asm page.inc
        public mosddtsh
        masm /DATT=0 mosddtsh,$*;
        del mosddtsh.pub
        link $*;
        del $*.obj
        exe2bin $* $*.sys
        del $*.exe

avterm.sys:	moxddtgn.asm  page.inc  macros.inc  avdef.inc
        public moxddtgn
        masm /DTERMDEF=avdef.inc moxddtgn,$*;
        del moxddtgn.pub
        link $*;
        del $*.obj
        exe2bin $* $*.sys
        del $*.exe

elterm.sys:	mosddtsh.asm page.inc
        public mosddtsh
        masm /DEMULINK=0 mosddtsh,$*;
        del mosddtsh.pub
        link $*;
        del $*.obj
        exe2bin $* $*.sys
        del $*.exe

exterm.sys:	moxddtgn.asm  page.inc macros.inc  exdef.inc
        public moxddtgn
        masm /DTERMDEF=exdef.inc moxddtgn,$*;
        del moxddtgn.pub
        link $*;
        del $*.obj
        exe2bin $* $*.sys
        del $*.exe

pcterm.sys:	mosddtsh.asm  page.inc
        public mosddtsh
	masm /DPCTERM=0 mosddtsh,$*;
        del mosddtsh.pub
        link $*;
        del $*.obj
        exe2bin $* $*.sys
        del $*.exe

swterm.sys:	mosddtsh.asm  page.inc
        public mosddtsh
	masm /DSHERWOOD=0 mosddtsh,$*;
        del mosddtsh.pub
        link $*;
        del $*.obj
        exe2bin $* $*.sys
        del $*.exe

srterm.sys :	srterm.asm  srterm.def  page.inc  options.inc  mosregs.inc \
				mostcb.inc  mosscbdf.inc  jmpmacro.inc  suniomac.inc \
				int14.inc  isrsub.inc vidchk.inc
        public srterm
		masm srterm;
		del srterm.pub
		link srterm;
		del srterm.obj
		exe2bin srterm srterm.sys
		del srterm.exe

t1term.sys:	moxddtgn.asm  page.inc  macros.inc  t1def.inc
        public moxddtgn
        masm /DTERMDEF=t1def.inc moxddtgn,$*;
        del moxddtgn.pub
        link $*;
        del $*.obj
        exe2bin $* $*.sys
        del $*.exe

trterm.sys:	mosddtsh.asm  page.inc
        public mosddtsh
	masm /DTRTERM=0 mosddtsh,$*;
        del mosddtsh.pub
        link $*;
        del $*.obj
        exe2bin $* $*.sys
        del $*.exe

ttterm.sys:	moxddtgn.asm  page.inc  macros.inc  ttdef.inc
        public moxddtgn
        masm /DTERMDEF=ttdef.inc moxddtgn,$*;
        del moxddtgn.pub
        link $*;
        del $*.obj
        exe2bin $* $*.sys
        del $*.exe

tvterm.sys:	moxddtgn.asm  page.inc  macros.inc  tvdef.inc
        public moxddtgn
        masm /DTERMDEF=tvdef.inc moxddtgn,$*;
        del moxddtgn.pub
        link $*;
        del $*.obj
        exe2bin $* $*.sys
        del $*.exe

view.sys:	view.asm  page.inc  mostcb.inc  mosscbdf.inc  \
			vptiomac.inc  jmpmacro.inc  int14.inc  isrsub.inc \
			macros.inc vidchk.inc
		public view
		masm view;
        	del view.pub
		link view;
		del view.obj
		exe2bin view view.sys
		del view.exe

unterm.sys:	unterm.asm  page.inc  mostcb.inc  mosscbdf.inc  \
			seriomac.inc  jmpmacro.inc  int14.inc  isrsub.inc \
			macros.inc vidchk.inc biosload.inc biosres.inc
		public unterm
		masm unterm;
        	del unterm.pub
		link unterm;
		del unterm.obj
		exe2bin unterm unterm.sys
		del unterm.exe

v4term.sys:	mosddtsh.asm  page.inc
        public mosddtsh
	masm /DVT420=0 mosddtsh,$*;
        del mosddtsh.pub
        link $*;
        del $*.obj
        exe2bin $* $*.sys
        del $*.exe

vgna.sys:	vgna.asm  page.inc  mostcb.inc  mosscbdf.inc  \
			seriomac.inc  jmpmacro.inc  int14.inc  isrsub.inc \
			vidchk.inc
		public vgna
		masm vgna;
                del vgna.pub
		link vgna;
		del vgna.obj
		exe2bin vgna vgna.sys
		del vgna.exe


vna.sys:	ddtvna.asm  page.inc  mostcb.inc  mosscbdf.inc  \
			seriomac.inc  macros.inc  int14.inc  isrsub.inc
        public ddtvna
        masm ddtvna,$*;
        del ddtvna.pub
		link $*;
        del $*.obj
        exe2bin $* $*.sys
        del $*.exe

wy99gt.sys:	ddtw99gt.asm  page.inc
        public ddtw99gt
		masm ddtw99gt,$*;
        del ddtw99gt.pub
		link $*;
        del $*.obj
        exe2bin $* $*.sys
        del $*.exe

w7term.sys:	mosddtsh.asm  page.inc
        public mosddtsh
	masm /DW7TERM=0 mosddtsh,$*;
        del mosddtsh.pub
        link $*;
        del $*.obj
        exe2bin $* $*.sys
        del $*.exe


