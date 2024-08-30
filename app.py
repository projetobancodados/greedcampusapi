from flask import Flask
from flask_jwt_extended import JWTManager
from routes import hunter_routes, auth_routes

from models import hunter_model


app = Flask(__name__)
app.config['JWT_SECRET_KEY'] = 'your secret key'
app.register_blueprint(hunter_routes.hunter)
app.register_blueprint(auth_routes.auth)
# app.secret_key = 'supersecretkey'  # Needed for flash messages

jwt = JWTManager(app)

# Initialize the database
hunter_model.create_hunters_table()
hunter_model.create_hunter_stats_table()
hunter_model.create_hunter_book_table()


if __name__ == '__main__':
  app.run(debug=True)
