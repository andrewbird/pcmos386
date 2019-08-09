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
cd kernel
del $$mos.sys

REM make -f kernel.mak $$eval.sys
REM ren $$eval.sys $$mos.sys

REM this was for internal R & D use only.
make -f kernel.mak $$mos.sys
if ERRORLEVEL 1 goto fail

cd ..
REM =======================

cd mos5src
make -f makeutil.mak all
if ERRORLEVEL 1 goto fail

rem make -f maketerm.mak all
rem if ERRORLEVEL 1 goto fail
del $*.*
ren __*.* $$*.*
ren _*.sys $*.sys
cd ..

cd import
make -f import.mak import.exe
if ERRORLEVEL 1 goto fail
cd ..

rem cd export
rem make -f export.mak export.exe
rem if ERRORLEVEL 1 goto fail
rem cd ..

del fail.txt
exit 0

:fail
cd ..
echo failed > fail.txt
exit 1
