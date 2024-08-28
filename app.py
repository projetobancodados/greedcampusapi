from flask import Flask, make_response, json
from flask_cors import CORS, cross_origin

from controllers import hunter_controller
from models import hunter_model

app = Flask(__name__)

app.secret_key = 'supersecretkey'  # Needed for flash messages

# Initialize the database
hunter_model.create_hunter_table()

# Routes
@app.route('/hunter/register', methods=['POST'])
@cross_origin()
def register_hunter():
  try:
    return hunter_controller.register_hunter()
  except Exception as e:
    print(e)
    return json.dumps({"msg": e.msg})

if __name__ == '__main__':
  app.run(debug=True)
