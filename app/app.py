from flask import Flask, render_template, request, jsonify
import random

app = Flask(__name__)

def generate_question():
    a = random.randint(1, 50)
    b = random.randint(1, 50)
    return a, b, a + b

@app.route("/")
def index():
    a, b, answer = generate_question()
    return render_template("index.html", num1=a, num2=b, answer=answer)

@app.route("/verify", methods=["POST"])
def verify():
    data = request.get_json()
    name = data.get("name", "").strip()
    user_answer = data.get("user_answer")
    correct_answer = data.get("correct_answer")

    if not name:
        return jsonify({"status": "error", "message": "Please enter your name!"})

    try:
        if int(user_answer) == int(correct_answer):
            return jsonify({"status": "success", "name": name})
        else:
            return jsonify({"status": "wrong", "message": "Wrong answer! Try again 🤔"})
    except:
        return jsonify({"status": "error", "message": "Please enter a valid number!"})

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)
