from flask_cors import cross_origin
from flask import Blueprint, json, request

from controllers import cards_controller

card = Blueprint('card', __name__)

# Route to get all available cards
@card.route('/cards', methods=['GET'])
@cross_origin()
def available_cards():
    """
    Rota para listar todas as cartas disponíveis no sistema.
    """
    try:
        return cards_controller.get_available_cards()
    except Exception as e:
        return json.dumps({"msg": str(e)}), 500


# Route to add a card to the Hunter's book
@card.route('/cards/book/add/<int:hunter_id>', methods=['POST'])
@cross_origin()
def add_card_to_book(hunter_id):
    """
    Rota para adicionar uma carta ao Book de um Hunter.
    """
    try:
        return cards_controller.add_card_to_book(hunter_id)
    except Exception as e:
        return json.dumps({"msg": str(e)}), 500


# Route to remove a card from the Hunter's book
@card.route('/cards/book/remove/<int:hunter_id>', methods=['DELETE'])
@cross_origin()
def remove_card_from_book(hunter_id):
    """
    Rota para remover uma carta do Book de um Hunter.
    """
    try:
        return cards_controller.remove_card_from_book(hunter_id)
    except Exception as e:
        return json.dumps({"msg": str(e)}), 500


# Route to get all cards in the Hunter's book
@card.route('/cards/book/<int:hunter_id>', methods=['GET'])
@cross_origin()
def get_cards_in_book(hunter_id):
    """
    Rota para listar todas as cartas que um Hunter possui em seu Book.
    """
    try:
        return cards_controller.get_cards_in_book(hunter_id)
    except Exception as e:
        return json.dumps({"msg": str(e)}), 500


# Route to buy a card by answering a question and paying with Jenny
@card.route('/cards/buy/<int:hunter_id>', methods=['POST'])
@cross_origin()
def buy_card_with_question(hunter_id):
    """
    Rota para permitir que o Hunter compre uma carta respondendo uma pergunta e pagando com Jenny.
    """
    try:
        return cards_controller.buy_card_with_question(hunter_id)
    except Exception as e:
        return json.dumps({"msg": str(e)}), 500


# Route to trade a card between two Hunters
@card.route('/cards/trade', methods=['POST'])
@cross_origin()
def trade_card():
    """
    Rota para permitir a troca de cartas entre dois Hunters.
    """
    try:
        return cards_controller.trade_card_between_hunters()
    except Exception as e:
        return json.dumps({"msg": str(e)}), 500
