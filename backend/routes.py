from flask import render_template, request
from app import app
from app.simulation import run_simulation

@app.route('/', methods=['GET', 'POST'])
def index():
    if request.method == 'POST':
        frequency = float(request.form['frequency'])
        amplitude = float(request.form['amplitude'])
        radius = float(request.form['radius'])
        data = run_simulation(frequency, amplitude, radius)
        return render_template('result.html', data=data)
    return render_template('index.html')