from flask import request
from models import hunter_model
from flask_jwt_extended import decode_token


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
    hunter_username = decode_token(hunter_username, allow_expired=True)
    hunter = hunter_model.fetch_hunter_auth(hunter_username['sub'])
    if not hunter:
      return {"msg": 'Hunter doesn\'t exists.'}
    return hunter


# Controller to get all hunters
def get_all_hunters():
  if request.method == 'GET':
    hunters = hunter_model.fetch_hunters()
    if not hunters:
      return {"msg": 'Error fetching hunters'}
    return hunters


# Controller to update hunter data
def update_hunter_by_id(hunter_id):
  if request.method == 'PATCH':
    hunter = request.get_json()
    hunter_to_update = {
      "Hunter_Id": int(hunter_id),
      "Username": hunter['Username'],
      "Password": hunter['Password'],
      "Email": hunter['Email'],
      "Avatar": hunter['Avatar'],
      "Location": hunter['Location'],
      "Type_Question": hunter['Type_Question'],
      "Type_Hunter": hunter['Type_Hunter']
    }
    hunter_model.update_hunter(hunter_id, hunter_to_update)
    if not hunter_to_update:
      return {"msg": 'Hunter doesn\'t exists.'}
    return hunter_to_update
  
  
def delete_hunter_by_id(hunter_id):
  if request.method == 'DELETE':
    hunter = hunter_model.fetch_hunter(hunter_id)
    if not hunter:
      return {"msg": 'Hunter doesn\'t exists.'}
    
    hunter_model.delete_hunter(hunter_id)
    hunter = hunter_model.fetch_hunter(hunter_id)
    if hunter:
      return {"msg": 'Error on Hunter Delete!'}
    
    return {"msg": 'Hunter deleted successfully!'}