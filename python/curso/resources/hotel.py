from flask_restful import Resource, reqparse

hoteis = [
  {
    'hotel_id': '123654',
    'nome': 'ALpha-hotel',
    'estrelas': 4.3,
    'diaria': 120.50,
    'cidade': 'Barueri'
  },
    {
    'hotel_id': '236525',
    'nome': 'CD-hotel',
    'estrelas': 2.1,
    'diaria': 120.50,
    'cidade': 'Osasco'
  },
    {
    'hotel_id': '852654',
    'nome': 'Silva-motel',
    'estrelas': 4.0,
    'diaria': 120.50,
    'cidade': 'Jandira'
  }
]

class Hoteis(Resource):
  def get(self):
    return {'hoteis': hoteis}

class Hotel(Resource):
  argumentos = reqparse.RequestParser()
  argumentos.add_argument('nome')
  argumentos.add_argument('estrelas')
  argumentos.add_argument('diaria')
  argumentos.add_argument('cidade')

  def find_hotel(hotel_id):
    for c in hoteis:
      if c['hotel_id'] == hotel_id:
        return c
    return None

  def get(self, hotel_id):
    hotel = Hotel.find_hotel(hotel_id)
    if hotel:
      return hotel
    return {'message': 'Hotel não encontrado.'}, 404 #

  def post(self, hotel_id):
    dados = Hotel.argumentos.parse_args()

    novo_hotel = {
      'hotel_id': hotel_id,
      'nome': dados['nome'],
      'estrelas': dados['estrelas'],
      'diaria': dados['diaria'],
      'cidade': dados['cidade']
    }

    hoteis.append(novo_hotel)
    return novo_hotel, 200

  def put(self, hotel_id):
    dados = Hotel.argumentos.parse_args()
    novo_hotel = {  'hotel_id': hotel_id, **dados  }

    hotel = Hotel.find_hotel(hotel_id)
    if hotel:
      hotel.update(novo_hotel)
      return novo_hotel, 200
    hoteis.append(novo_hotel)
    return novo_hotel, 201

  def delete(self, hotel_id):
    global hoteis
    hoteis = [c for c in hoteis if c['hotel_id'] != hotel_id]
    return {'message': 'Hotel deletado'}

