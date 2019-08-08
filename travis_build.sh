#!/bin/sh

mkdir -p ${HOME}/.dosemu/run
touch ${HOME}/.dosemu/disclaimer

[ -d ${HOME}/.dosemu/drive_c ] || mkdir ${HOME}/.dosemu/drive_c
tar -C ${HOME}/.dosemu/drive_c -xvf FR-DOS-1.20.tar kernel.sys command.com
cp /usr/share/dosemu/commands/fdconfig.sys ${HOME}/.dosemu/drive_c/.
cp /usr/share/dosemu/commands/autoexec.bat ${HOME}/.dosemu/drive_c/.

cd SOURCES/src || exit 1

./build.sh
