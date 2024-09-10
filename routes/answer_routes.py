from flask_cors import cross_origin
from flask import Blueprint, json

from controllers import answer_controller

answer = Blueprint('answer', __name__)

# Get all answers
@answer.route('/answers', methods=['GET'])
@cross_origin()
def get_all_answers():
  try:
    return answer_controller.fetch_answers()
  except Exception as e:
    return json.dumps({"msg": e.msg})


@answer.route('/answer/add', methods=['POST'])
@cross_origin()
def add_answer():
  try:
    return answer_controller.add_answer()
  except Exception as e:
    return json.dumps({"msg" : e.msg})
  
  
@answer.route('/answer/remove', methods=['DELETE'])
@cross_origin()
def remove_answer():
  try:
    return answer_controller.remove_answer()
  except Exception as e:
    return json.dumps({"msg" : e.msg})