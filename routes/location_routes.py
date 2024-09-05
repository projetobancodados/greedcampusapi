from flask_cors import cross_origin
from flask import Blueprint, json

from controllers import location_controller

location = Blueprint('location', __name__)


# Get all locations
@location.route('/locations', methods=['GET'])
@cross_origin()
def fetch_locations():
  try:
    return location_controller.fetch_locations()
  except Exception as e:
    return json.dumps({"msg": e.msg})