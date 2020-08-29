rem echo off
cls

path=%PATH%;c:\bin
set TMP=c:\TMP
mkdir %TMP%

set INCLUDE=..\..\..\include;..\include
set LIB=..\..\..\lib;..\libs

REM =======================
rem Build KERNEL (both)
gmake -C latest -f kernel.mak
if ERRORLEVEL 1 exit 1

REM =======================
rem Build UTILITIES
gmake -C latest -f utils.mak
if ERRORLEVEL 1 exit 1
ren latest\moxcptsk.com latest\command.com

REM =======================
rem Build TERMINALS
rem make -f maketerm.mak all
ren __*.* $$*.*
ren _*.sys $*.sys

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
