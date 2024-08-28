from flask import Flask, make_response, json
from flask_cors import CORS, cross_origin

from controllers import hunter_controller
from models import hunter_model

app = Flask(__name__)

app.secret_key = 'supersecretkey'  # Needed for flash messages

# Initialize the database
hunter_model.create_hunter_table()

# Routes

# Register hunter
@app.route('/hunter/register', methods=['POST'])
@cross_origin()
def register_hunter():
  try:
    return hunter_controller.register_hunter()
  except Exception as e:
    return json.dumps({"msg": e.msg})


# Get hunter by id
@app.route('/hunter/<hunter_id>', methods=['GET'])
@cross_origin()
def get_hunter_by_id(hunter_id):
  try:
    return hunter_controller.get_hunter_by_id(hunter_id)
  except Exception as e:
    return json.dumps({"msg": e.msg})


if __name__ == '__main__':
  app.run(debug=True)
