from flask import Flask
from flask_jwt_extended import JWTManager

from routes import hunter_routes, auth_routes, location_routes, question_routes, cards_routes, answer_routes

from models import hunter_model, location_model, question_model, cards_model, answer_model


app = Flask(__name__)
app.config['JWT_SECRET_KEY'] = 'your secret key'
app.register_blueprint(hunter_routes.hunter)
app.register_blueprint(auth_routes.auth)
app.register_blueprint(location_routes.location)
app.register_blueprint(question_routes.question)
app.register_blueprint(cards_routes.card)  # Registra o novo blueprint de Cards
app.register_blueprint(answer_routes.answer)
# app.secret_key = 'supersecretkey'  # Needed for flash messages

# Inicializa o JWT Manager
jwt = JWTManager(app)

# Initialize the database

cards_model.create_cards_difficulty_table() # Inicializa a tabela Cards_Difficulty

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

# Hunter views
hunter_model.create_all_hunter_info_view()

# Answer
answer_model.create_answer_table()

# Se precisar inicializar a tabela de Cards
cards_model.create_cards_table()  # Inicializa a tabela de Cards no banco
cards_model.create_card_challenge_table()
cards_model.create_card_challenge_answer_table()
cards_model.create_book_cards_table()  # Inicializa a tabela associativa book_cards (se houver)

answer_model.create_all_hunter_answer_view()
cards_model.create_grant_card_by_challenge_procedure()
cards_model.create_grant_card_by_buying_procedure()

# Inicia a aplicação
if __name__ == '__main__':
    app.run(debug=True)
