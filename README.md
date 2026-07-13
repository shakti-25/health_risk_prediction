# 🏥 Healthcare Risk Prediction Using Machine Learning

A Machine Learning-based Healthcare Risk Prediction System that predicts whether a patient is at **High Risk** or **Low Risk** using healthcare data. The project combines **SQL** for database management, **Python** for data preprocessing and model training, and **Flask** for deploying an interactive web application.

---

## 📌 Project Overview

This project demonstrates an end-to-end healthcare analytics workflow by integrating SQL, Machine Learning, and Flask. Patient records, diagnoses, laboratory results, and treatment outcomes are analyzed to predict healthcare risk and provide real-time predictions through a web application.

---

## ✨ Features

- Predicts patient risk (High Risk / Low Risk)
- Interactive Flask web application
- Data preprocessing and feature engineering
- Machine Learning model for healthcare risk prediction
- SQL database design and healthcare data analysis
- Displays prediction probability

---

## 🛠️ Technologies Used

- Python
- Flask
- Scikit-learn
- Pandas
- NumPy
- MySQL
- HTML5
- Joblib

---

## 📂 Project Structure

```
Healthcare-Risk-Prediction/
│
├── templates/
│   └── index.html
│
├── app.py
├── model.ipynb
├── risk_model.pkl
├── scaler.pkl
├── risk.sql
├── patients.csv
├── diagnoses.csv
├── outcomes.csv
├── labs.csv
└── README.md
```

---

## 🗄️ Database Design

The healthcare database consists of four related tables:

- **Patients** – Patient demographic and treatment details
- **Diagnoses** – Disease information
- **Outcomes** – Patient treatment outcomes
- **Lab** – Laboratory test results

### SQL Operations Performed

- Database and table creation
- Primary and Foreign Key relationships
- Multi-table JOIN queries
- Aggregate functions
- GROUP BY and ORDER BY
- Data cleaning and standardization
- Healthcare data analysis

### SQL Analysis Queries

- Retrieve patient laboratory history
- Calculate average laboratory results by diagnosis
- Identify patients with abnormal laboratory reports
- Find diagnoses with the highest treatment cost
- Identify high-risk elderly patients
- Analyze laboratory trends over time
- Distribution of treatment outcomes by diagnosis
- Standardize laboratory test names and normal ranges

---

## 📊 Dataset

The project uses four datasets:

- patients.csv
- diagnoses.csv
- outcomes.csv
- labs.csv

These datasets are merged and preprocessed before training the Machine Learning model.

---

## 🤖 Machine Learning Workflow

1. Load healthcare datasets
2. Merge datasets
3. Data preprocessing
4. Feature engineering
5. Calculate Length of Stay
6. Encode patient outcomes
7. Generate abnormal laboratory counts
8. Train Logistic Regression model
9. Evaluate model performance
10. Save trained model
11. Deploy using Flask

---

## 📈 Features Used for Prediction

- Age
- Length of Stay
- Treatment Cost

Additional engineered feature:

- Abnormal Lab Count

---

## 🚀 Installation

### Clone Repository

```bash
git clone https://github.com/YOUR_USERNAME/Healthcare-Risk-Prediction.git
```

### Install Dependencies

```bash
pip install flask pandas numpy scikit-learn joblib
```

### Run Application

```bash
python app.py
```

Open your browser:

```
http://127.0.0.1:5000
```

---

## 📊 Model Evaluation

The model was evaluated using:

- Accuracy
- Precision
- Recall
- F1-Score
- Confusion Matrix
- ROC Curve

---

## 📸 Application

The web application accepts:

- Age
- Length of Stay
- Treatment Cost

and predicts:

- High Risk
- Low Risk
- Risk Probability (%)

---

## 🔮 Future Enhancements

- Improve prediction accuracy using advanced ensemble models
- Deploy on cloud platforms (AWS/Render)
- Add user authentication
- Dashboard for healthcare analytics
- Real-time database connectivity
- Support for multiple prediction models

---

## 👨‍💻 Author

**Shakti Thevar**


---

## 📄 License

This project is developed for educational and learning purposes.
