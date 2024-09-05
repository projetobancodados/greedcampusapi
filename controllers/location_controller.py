from flask import request
from models import location_model


def fetch_locations():
  if request.method == 'GET':
    locations = location_model.fetch_locations()
    if not locations:
      return {"msg": "Error retrieving locations"}
    return locations