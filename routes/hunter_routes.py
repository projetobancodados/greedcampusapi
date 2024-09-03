from flask_cors import cross_origin
from flask import Blueprint, json, request

from controllers import hunter_controller

hunter = Blueprint('hunter', __name__)


# Register hunter
@hunter.route('/hunter/register', methods=['POST'])
@cross_origin()
def register_hunter():
  try:
    return hunter_controller.register_hunter()
  except Exception as e:
    return json.dumps({"msg": e.msg})
  
  
# Get hunter by id
@hunter.route('/hunter/<hunter_id>', methods=['GET'])
@cross_origin()
def get_hunter_by_id(hunter_id):
  try:
    return hunter_controller.get_hunter_by_id(hunter_id)
  except Exception as e:
    return json.dumps({"msg": e.msg})
  

# Get hunter by username
@hunter.route('/hunter/username/<hunter_username>', methods=['GET'])
@cross_origin()
def get_hunter_by_username(hunter_username):
  try:
    return hunter_controller.get_hunter_by_username(hunter_username)
  except Exception as e:
    return json.dumps({"msg": e.msg})

 
# Update hunter by id
@hunter.route('/hunter/update/<hunter_id>', methods=['PATCH'])
@cross_origin()
def update_hunter_by_id(hunter_id):
  try:
    return hunter_controller.update_hunter_by_id(hunter_id)
  except Exception as e:
    return json.dumps({"msg": e.msg})