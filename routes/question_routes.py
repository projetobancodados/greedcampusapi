from flask_cors import cross_origin
from flask import Blueprint, json

from controllers import question_controller

question = Blueprint('question', __name__)


# Get all questions
@question.route('/questions', methods=['GET'])
@cross_origin()
def get_all_questions():
  try:
    return question_controller.fetch_questions()
  except Exception as e:
    return json.dumps({"msg": e.msg})


# Get all types_question
@question.route('/typesquestion', methods=['GET'])
@cross_origin()
def get_all_types_question():
  try:
    return question_controller.fetch_types_question()
  except Exception as e:
    return json.dumps({"msg": e.msg})