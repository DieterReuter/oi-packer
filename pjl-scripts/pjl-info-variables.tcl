#!/usr/bin/tclsh

set printer 194.49.3.130
set port 9100

puts "Open Printer $printer on port $port\n"
set sockChan [socket $printer $port]
puts -nonewline $sockChan "\033%-12345X@PJL INFO VARIABLES\n"
flush $sockChan
puts "DATA=start"
while {[set data [read $sockChan 1]] != "\x0c"} {
   puts -nonewline $data
}
puts "\nDATA=end"
close $sockChan

