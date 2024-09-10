from flask import request
from models import answer_model, cards_model, hunter_model

def fetch_answers():
  if request.method == 'GET':
    answers = answer_model.fetch_answers()
    if not answers:
      return { "answers": [] }
    return { "answers": answers  }
  
  
def add_answer():
  if request.method == 'POST':
    hunter_id = request.json['hunter_id']
    answer = request.json['content']
    card_id = request.json['card_id']
    question_id = request.json['question_id']
    jenny_value = request.json['jenny_value']
    
    card_challenge = cards_model.check_card_challenge(card_id, hunter_id)
    
    if card_challenge:
      return {"msg": "You already have a Challenge under analysis!"}
    
    answer_id = answer_model.add_answer(answer, hunter_id, question_id)
    card_challenge_id = cards_model.add_card_challenge(card_id)
    hunter_model.update_hunter_stats_jenny(hunter_id, int(jenny_value) * (-1))
    
    if answer_id and card_challenge_id:
      cards_model.add_card_challenge_answer(answer_id, card_challenge_id)
      return {"msg": "Challenge successfully submitted!"}
  return {}


def remove_answer():
  if request.method == 'DELETE':
    answer_id = request.json['Answer_Id']
    card_challenge_id = request.json['Card_Challenge_Id']
    
    answer_model.remove_answer(answer_id)
    cards_model.remove_card_challenge(card_challenge_id)
    
    return {"msg": "Answer successfully removed!"}
    
  return {}