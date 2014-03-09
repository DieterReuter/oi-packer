//---
// Send9100:
//    - using TCP port 9100 to send printing data to a network printer
//
//---

var net = require('net');
var PRINTER = '194.49.3.130';
var PORT = 9100;

var printer = new net.Socket();

// Add a 'data' event handler
printer.on('data', function(data) {
  console.log('Socket-Event: "data" ' + printer.remoteAddress +' '+ printer.remotePort);
  console.log('DATA ' + printer.remoteAddress + ': ' + data.length + ' Bytes ' + JSON.stringify(data.toString()));
  printer.destroy();
});

printer.connect(PORT, PRINTER, function() {
  console.log('CONNECTED TO: ' + PRINTER + ':' + PORT);
  printer.write('\033%-12345X@PJL INFO CONFIG\n');
  printer.write('\033%-12345X@PJL INFO STATUS\n');
  printer.write('\033%-12345X@PJL INFO ID\n');
  //printer.destroy();
});


