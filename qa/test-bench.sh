#!/bin/sh
# tools:
#   iverilog: Icarus Verilog version 12.0 (stable)
#        vvp: Icarus Verilog runtime version 12.0 (stable)
set -e
cd $(dirname "$0")

SRCPTH=../../src
LIBPTH=/home/c/.wine/drive_c/Gowin/Gowin_V1.9.9.03_x64/IDE/simlib/gw1n/prim_tsim.v

cd $1
pwd

# switch for system verilog
# -g2005-sv 

iverilog -Winfloop -pfileline=1 -o iverilog.vvp TestBench.v \
    $SRCPTH/BESDPB.v \
    $SRCPTH/Cache.v \
    $SRCPTH/BurstRAM.v \
    $SRCPTH/gowin_rpll/gowin_rpll.v \
    $LIBPTH

vvp iverilog.vvp
rm iverilog.vvp
