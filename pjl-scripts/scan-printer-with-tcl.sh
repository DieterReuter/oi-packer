#!/bin/sh -x 

time ./pjl-info-argv.tcl ID > scan.printer.PJL-INFO-ID.log
time ./pjl-info-argv.tcl CONFIG > scan.printer.PJL-INFO-CONFIG.log
time ./pjl-info-argv.tcl FILESYS > scan.printer.PJL-INFO-FILESYS.log
time ./pjl-info-argv.tcl MEMORY > scan.printer.PJL-INFO-MEMORY.log
time ./pjl-info-argv.tcl PAGECOUNT > scan.printer.PJL-INFO-PAGECOUNT.log
time ./pjl-info-argv.tcl STATUS > scan.printer.PJL-INFO-STATUS.log
time ./pjl-info-argv.tcl VARIABLES > scan.printer.PJL-INFO-VARIABLES.log
time ./pjl-info-argv.tcl USTATUS > scan.printer.PJL-INFO-USTATUS.log

#time ./pjl-info-argv.tcl ID > scan.printer.PJL-INFO-ID.log
#time ./pjl-info-argv.tcl ID > scan.printer.PJL-INFO-ID.log
#time ./pjl-info-argv.tcl ID > scan.printer.PJL-INFO-ID.log
