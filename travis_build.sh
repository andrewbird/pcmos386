#!/bin/sh

cd SOURCES/src || exit 1

mkdir -p ${HOME}/.dosemu/run
touch ${HOME}/.dosemu/disclaimer

./build.sh
