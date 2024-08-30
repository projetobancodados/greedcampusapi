from flask_cors import cross_origin
from flask import Blueprint, json

from controllers import auth_controller

auth = Blueprint('auth', __name__)


# Login hunter
@auth.route('/auth/login', methods=['POST'])
@cross_origin()
def login_hunter():
  try:
    return auth_controller.token()
  except Exception as e:
    return json.dumps({"msg": e.msg})