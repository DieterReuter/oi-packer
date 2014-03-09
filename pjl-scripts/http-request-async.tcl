#!/usr/bin/tclsh

set server info.plossys.net
set port 80

proc readAnswer {channel} {
   global data
   global didRead
   set data [read $channel]
   set didRead 1
}

puts "Open Server $server on port $port\n"
set sockChan [socket -async $server $port]
fileevent $sockChan writable {set connected 1}
fileevent $sockChan readable "readAnswer $sockChan"
vwait connected

chan configure $sockChan -blocking 0
puts $sockChan "GET / HTTP/1.0"
puts $sockChan ""
flush $sockChan

vwait didRead
puts "DATA=start"
puts -nonewline $data
puts "\nDATA=end"

close $sockChan

