# controllers/cards_controller.py
from flask import request, jsonify
from models.cards_model import CardModel

# Instanciando o modelo de Cards
card_model = CardModel()

# Controller to get all available cards
def get_available_cards(hunter_id):
    """
    Retorna todas as cartas disponíveis no sistema, incluindo informações como quantidade e dificuldade.
    """
    if request.method == 'GET':
        available_cards = card_model.get_available_cards(hunter_id)
        if not available_cards:
            return {"game_cards": []}
        return {"game_cards": available_cards}

# Controller to add a card to the Hunter's book
def add_card_to_book(hunter_id):
    """
    Adiciona uma carta ao Book do Hunter, se houver quantidade disponível.
    """
    if request.method == 'POST':
        card_id = request.json.get('Card_Id')

        if not card_id:
            return jsonify({"msg": "Card ID is required."}), 400

        # Adiciona a carta ao Book do Hunter usando o card_model
        card_model.add_card_to_book(hunter_id, card_id)

        return jsonify({"msg": f"Card {card_id} added to Hunter {hunter_id}'s book."}), 200

# Controller to remove a card from the Hunter's book
def remove_card_from_book(hunter_id):
    """
    Remove uma carta do Book do Hunter, respeitando as restrições.
    """
    if request.method == 'DELETE':
        card_id = request.json.get('card_id')

        if not card_id:
            return jsonify({"msg": "Card ID is required."}), 400

        # Remove a carta do Book do Hunter usando o card_model
        result = card_model.remove_card_from_book(hunter_id, card_id)

        if "msg" in result:
            return jsonify(result), 400

        return jsonify({"msg": f"Card {card_id} removed from Hunter {hunter_id}'s book."}), 200

# Controller to get all cards in the Hunter's book
def get_cards_in_book(hunter_id):
    """
    Lista todas as cartas que o Hunter possui em seu Book.
    """
    if request.method == 'GET':
        cards_in_book = card_model.get_cards_in_book(hunter_id)
        if not cards_in_book:
            return {"hunter_cards": []}

        return {"hunter_cards": cards_in_book}

# Controller to buy a card using Jenny and a question
def buy_card_with_question(hunter_id):
    """
    Permite que o Hunter compre uma carta respondendo uma pergunta e pagando em Jenny.
    """
    if request.method == 'POST':
        card_id = request.json.get('card_id')
        jenny_paid = request.json.get('jenny_paid')
        answer = request.json.get('answer')

        if not card_id or not jenny_paid or not answer:
            return jsonify({"msg": "Card ID, Jenny paid, and answer are required."}), 400

        # Verifica a compra da carta usando o card_model
        result = card_model.buy_card_with_question(hunter_id, card_id, jenny_paid, answer)

        if "msg" in result:
            return jsonify(result), 400

        return jsonify({"msg": f"Card {card_id} successfully purchased by Hunter {hunter_id}."}), 200

# Controller to trade cards between two Hunters
def trade_card_between_hunters():
    """
    Permite a troca de cartas entre dois Hunters.
    """
    if request.method == 'POST':
        hunter_id_from = request.json.get('hunter_id_from')
        hunter_id_to = request.json.get('hunter_id_to')
        card_id = request.json.get('card_id')

        if not hunter_id_from or not hunter_id_to or not card_id:
            return jsonify({"msg": "Hunter IDs and Card ID are required."}), 400

        # Realiza a troca de cartas usando o card_model
        card_model.trade_card_between_hunters(hunter_id_from, hunter_id_to, card_id)

        return jsonify({"msg": f"Card {card_id} traded from Hunter {hunter_id_from} to Hunter {hunter_id_to}."}), 200