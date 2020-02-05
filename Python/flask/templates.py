from flask import Flask, render_template

app = Flask(__name__)

@app.route('/')
def hello_world():
    return '<h1>Hello from flask</h1>'

# OJO: el directoria por defecto es 'templates', donde se alojan todos los HTML
@app.route('/plantilla1')
def plantilla1():
    return render_template('plantilla1.html')


@app.route('/plantilla2/')
@app.route('/plantilla2/<nombre>')
def plantilla2(nombre=None):
    return render_template('plantilla2.html', nombre=nombre)

# Uso de formulario y POST 
from flask import request
@app.route('/login', methods=['GET', 'POST'])
def login():
    error = None
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']
        if username == 'abc' and password=='abc':
            return render_template('login_correct.html', username = username)
        else:
            error = 'Invalid username/password'
            return render_template('login.html', error=error)
    else:
        error = '' # primer GET, no hay errores
        return render_template('login.html', error=error)


if __name__ == '__main__':
    app.run('0.0.0.0', 5000, debug=True)



