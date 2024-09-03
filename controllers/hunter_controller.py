from flask import request
from models import hunter_model


# Controller to add a hunter
def register_hunter():
  if request.method == 'POST':
    username = request.json['username']
    email = request.json['email']
    password = request.json['password']

    # Add hunter using the model
    hunter_model.add_hunter(username, email, password)
    
    # Retrieve newly created hunter
    db_hunter = hunter_model.fetch_hunter_auth(username)
    
    # add hunter stats to hunter
    if db_hunter:
      hunter_model.add_hunter_stats(db_hunter['Hunter_Id'])
      hunter_model.add_hunter_book(db_hunter['Hunter_Id'])
    
    return {"msg": 'Hunter registered successfully!'}


# Controller to get hunter by id
def get_hunter_by_id(hunter_id):
  if request.method == 'GET':
    hunter = hunter_model.fetch_hunter(hunter_id)
    if not hunter:
      return {"msg": 'Hunter doesn\'t exists.'}
    return hunter


# Controller to get hunter by username
def get_hunter_by_username(hunter_username):
  if request.method == 'GET':
    hunter = hunter_model.fetch_hunter_auth(hunter_username)
    if not hunter:
      return {"msg": 'Hunter doesn\'t exists.'}
  return hunter


# Controller to update hunter data
# def update_hunter_by_id(hunter_id):
#   if request.method == 'POST':
#     hunter = hunter_model.fetch_hunter(hunter_id)
#     if not hunter:
#       return {"msg": 'Hunter doesn\'t exists.'}
#     return hunter