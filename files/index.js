var http = require('http');
http.createServer(function (req, res) {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('DevOps Exam');
}).listen(6543, "0.0.0.0");
console.log('Server running at http://0.0.0.0:6543/');