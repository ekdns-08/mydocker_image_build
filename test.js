const http = require('http');
const fs = require('fs');
const os = require('os');

const handleRequest = function(request, response) {
    if (request.url === "/") {
        fs.readFile('./index.html', function(err, data) {
            if (err) {
                response.writeHead(404);
                response.end("404 Not Found");
                return;
            }
            response.writeHead(200, {'Content-Type': 'text/html'});
            response.end(data);
        });
    } else if (request.url === "/pod-info") {
        const podInfo = {
            podName: os.hostname(),
            podIP: process.env.POD_IP // Set this environment variable in your pod spec
        };
        response.writeHead(200, {'Content-Type': 'application/json'});
        response.end(JSON.stringify(podInfo));
    }
};

const www = http.createServer(handleRequest);
www.listen(8080, () => console.log(`Server started on port 8080`));
