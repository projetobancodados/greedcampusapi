# controllers/main_controller.py

from flask import request
from models import hunter_model


# Route to add a hunter
def register_hunter():
  if request.method == 'POST':
    username = request.json['username']
    email = request.json['email']
    password = request.json['password']

    # Add user using the model
    db_hunter = hunter_model.add_hunter(username, email, password)
    return {"msg": 'Hunter registered successfully!'}


def get_hunter_by_id(hunter_id):
  if request.method == 'GET':
    hunter = hunter_model.fetch_hunter(hunter_id)
    if not hunter:
      return {"msg": 'Hunter doesn\'t exists.'}
    return hunter
  