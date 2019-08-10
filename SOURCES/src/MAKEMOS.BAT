rem echo off

set TMP=c:\TMP
if not exist %TMP% mkdir %TMP%

set INCLUDE=..\..\..\include;..\include
set LIB=..\..\..\lib;..\libs

rem goto here

REM ====== Generate serial number and registration script
gmake -C latest -f makeser.gmk clean all
if ERRORLEVEL 1 goto fail

REM ====== The Kernel =====
gmake -C latest -f kernel.gmk clean all
if ERRORLEVEL 1 goto fail

REM ======  Building Utilities ======
gmake -C latest -f makeutil.gmk clean all
if ERRORLEVEL 1 goto fail

:here

REM ======  Building Terminals ======
gmake -C latest -f maketerm.gmk clean all
if ERRORLEVEL 1 goto fail

:done
del fail.txt
exit 0

:fail
echo failed > fail.txt
exit 1
