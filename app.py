from flask import Flask
from flask_jwt_extended import JWTManager
from routes import hunter_routes, auth_routes, cards_routes  # Importar o novo blueprint de cards
from models import hunter_model, cards_model  # Importar o modelo de Cards

app = Flask(__name__)
app.config['JWT_SECRET_KEY'] = 'your secret key'  # Chave secreta para JWT
app.register_blueprint(hunter_routes.hunter)  # Registra o blueprint de Hunter
app.register_blueprint(auth_routes.auth)  # Registra o blueprint de Auth
app.register_blueprint(cards_routes.card)  # Registra o novo blueprint de Cards

# Inicializa o JWT Manager
jwt = JWTManager(app)

# Inicializar as tabelas do banco de dados
hunter_model.create_hunters_table()
hunter_model.create_hunter_stats_table()
hunter_model.create_hunter_book_table()

# Se precisar inicializar a tabela de Cards
cards_model.create_cards_table()  # Inicializa a tabela de Cards no banco
cards_model.create_book_cards_table()  # Inicializa a tabela associativa book_cards (se houver)

# Inicia a aplicação
if __name__ == '__main__':
    app.run(debug=True)
