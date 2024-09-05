from flask import request
from models import question_model


def fetch_questions():
  if request.method == 'GET':
    questions = question_model.fetch_questions()
    if not questions:
      return {"msg": "Error retrieving questions"}
    return questions
  
  
def fetch_types_question():
  if request.method == 'GET':
    types_question = question_model.fetch_types_question()
    if not types_question:
      return {"msg": "Error retrieving types question"}
    return types_question