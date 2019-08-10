rem echo off

set TMP=c:\TMP
if not exist %TMP% mkdir %TMP%

set INCLUDE=..\..\..\include;..\include
set LIB=..\..\..\lib;..\libs

REM ====== The Kernel =====
gmake -C latest -f kernel.gmk clean all
if ERRORLEVEL 1 goto fail

:done
del fail.txt
exit 0

:fail
echo failed > fail.txt
exit 1
