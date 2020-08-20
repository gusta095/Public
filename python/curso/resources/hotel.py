from flask_restful import Resource

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
  def get(self, hotel_id):
    for c in hoteis:
      if c['hotel_id'] == hotel_id:
        return c
    return {'message': 'Hotel não encontrado.'}, 404 #

  def post(self, hotel_id):
    pass

  def put(self, hotel_id):
    pass

  def delete(self, hotel_id):
    pass

