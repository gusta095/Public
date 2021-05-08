from flask import Flask, request
from main import insertUser

app = Flask('Gusta-net')

@app.route('/', methods=['GET'])
def OlaMundo():
  return {'Ola':'Mundo'}

@app.route('/create-user', methods=['POST'])
def create_user():

  body = request.get_json()

  usuario = insertUser()

  return usuario

app.run(host='0.0.0.0',port='8080')