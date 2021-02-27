from flask import Flask
from flask_restful import Resource, Api

# from resources.hotel import Hoteis, Hotel

app = Flask(__name__)
api = Api(app)

class Media(Resource):
  def conta(msg):
    msg = 'Deu certo'
    print(msg)


api.add_resource(Media, '/conta')
# api.add_resource(Hotel, '/hoteis/<string:hotel_id>')

if __name__ == '__main__':
    app.run(host='0.0.0.0',port='8080',debug=True)
