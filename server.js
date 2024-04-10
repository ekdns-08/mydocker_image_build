const http = require('http');
const os = require('os');

const handleRequest = function(request, response) {
  console.log('Received request for URL: ' + request.url);
  response.writeHead(200);
  response.end("This is your pod: \n\nPod Name: " + os.hostname() + "\nPod IP: " + process.env.POD_IP);
};

const www = http.createServer(handleRequest);
www.listen(8080);
