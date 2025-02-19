from flask import Flask
import requests

app = Flask(__name__)

@app.route('/')
def hello_world():
    return 'Hello, World!'

@app.route('/external')
def fetch_data():
    response = requests.get('https://api.github.com')
    return response.json()

if __name__ == '__main__':
    app.run(debug=True)
