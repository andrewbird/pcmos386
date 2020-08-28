rem echo off
cls
REM SHIPPING.MOS CONTAINS THE ACTUAL CODE THAT IS SHIPPING.
REM VERSION 5 UPDATE 6.
path=%PATH%;c:\bin
set TMP=c:\TMP
mkdir %TMP%

set INCLUDE=..\..\..\include;..\include
set LIB=..\..\..\lib;..\libs

REM ====== The Kernel =====
cd latest
del $*.*

REM make -f kernel.mak $$eval.sys
REM ren $$eval.sys $$mos.sys

REM this was for internal R & D use only.
make -f kernel.mak $$mos.sys
if ERRORLEVEL 1 exit 1

rem cd ..
REM =======================

rem cd mos5src
make -f makeutil.mak all
if ERRORLEVEL 1 exit 1
ren moxcptsk.com command.com
rem make -f maketerm.mak all
ren __*.* $$*.*
ren _*.sys $*.sys
cd ..

REM =======================
rem Build IMPORT
gmake -C import
if ERRORLEVEL 1 exit 1

REM =======================
rem Build EXPORT
rem gmake -C export
rem if ERRORLEVEL 1 exit 1

REM =======================
rem Build CDLINK
gmake -C cdlink
if ERRORLEVEL 1 exit 1
