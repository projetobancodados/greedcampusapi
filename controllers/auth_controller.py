from flask import request, jsonify
from flask_jwt_extended import create_access_token

from models.hunter_model import fetch_hunter_auth


def token():
  if request.method == 'POST':
    username = request.json['username']
    password = request.json['password']
    
    hunter = fetch_hunter_auth(username)
    if hunter:
      if hunter['Username'] == username and hunter['Password'] == password:
        access_token = create_access_token(identity=username)
        return jsonify(access_token=access_token)
  return jsonify({"msg": "Incorrect username or password"}), 401