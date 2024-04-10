from flask import Flask
import os
import socket

app = Flask(__name__)

@app.route('/')
def home():
    pod_name = os.getenv('HOSTNAME', 'Unknown')
    pod_ip = socket.gethostbyname(pod_name)
    return f'<h1>Pod Information</h1><p>Pod Name: {pod_name}</p><p>Pod IP: {pod_ip}</p>'

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=80)
