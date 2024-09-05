from flask import Flask
from flask_jwt_extended import JWTManager
from routes import hunter_routes, auth_routes, location_routes, question_routes

from models import hunter_model, location_model, question_model


app = Flask(__name__)
app.config['JWT_SECRET_KEY'] = 'your secret key'
app.register_blueprint(hunter_routes.hunter)
app.register_blueprint(auth_routes.auth)
app.register_blueprint(location_routes.location)
app.register_blueprint(question_routes.question)
# app.secret_key = 'supersecretkey'  # Needed for flash messages

jwt = JWTManager(app)

# Initialize the database
# Question
question_model.create_types_question_table()
question_model.create_question_table()

# Location
location_model.create_location_table()

# Hunter
hunter_model.create_types_hunter_table()
hunter_model.create_hunters_table()
hunter_model.create_hunter_stats_table()
hunter_model.create_hunter_book_table()


if __name__ == '__main__':
  app.run(debug=True)
