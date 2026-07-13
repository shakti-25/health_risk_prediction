from flask import Flask, render_template, request
import pandas as pd
import joblib

app = Flask(__name__)

# Load model and scaler
model = joblib.load("risk_model.pkl")
scaler = joblib.load("scaler.pkl")


@app.route("/", methods=["GET", "POST"])
def home():

    prediction = None
    probability = None

    if request.method == "POST":

        age = int(request.form["age"])
        length = int(request.form["length"])
        cost = float(request.form["cost"])
        abnormal = int(request.form["abnormal"])

        input_data = pd.DataFrame(
            [[age, length, cost, abnormal]],
            columns=[
                "Age",
                "LengthOfStay",
                "TreatmentCost",
                "AbnormalCounts"
            ]
        )

        # Scale the input
        input_scaled = scaler.transform(input_data)

        pred = model.predict(input_scaled)[0]
        prob = model.predict_proba(input_scaled)[0][1]

        prediction = "High Risk" if pred == 1 else "Low Risk"
        probability = round(prob * 100, 2)

    return render_template(
        "index.html",
        prediction=prediction,
        probability=probability
    )


if __name__ == "__main__":
    app.run(debug=True)