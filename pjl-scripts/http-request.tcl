#!/usr/bin/tclsh

set server info.plossys.net
set port 80

puts "Open Server $server on port $port\n"
set sockChan [socket $server $port]
puts $sockChan "GET / HTTP/1.0"
puts $sockChan ""
flush $sockChan
puts "DATA=start"
set data [read $sockChan ]
puts -nonewline $data
puts "\nDATA=end"
close $sockChan

