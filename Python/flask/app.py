#Basado en https://github.com/OpenWebinarsNet/curso_flask

# mapear un puerto con docker para acceder el proyecto con localhost:8000
# docker run -it -p 8000:5000 python:3.8.1-slim-buster

# Crear un entorno virtual para ejecutar este proyecto
#> python3 -m venv flaskproject
#> source flaskproject/bin/activate


from flask import Flask

app = Flask(__name__)

@app.route('/')

def hello_world():
    return '<h1>Hello from flask</h1>'

@app.route('/test1')
def test1():
    return '<h1>Test1 from flask</h1>'

@app.route('/test2')
# ves que la ruta no tiene que coincidir con la funcion definida
def test22():
    return '<h1>Test2 from flask</h1>'

@app.route('/test3/<int:id>')
# rutas dinámicas
#@app.route('/test3/<id>') - mas sencillo
def test3(id):
    return '<h1>Test3 from flask con id:{} </h1>'.format(id)

@app.route('/test4/')
@app.route('/test4/<string:nombre>')
@app.route('/test4/<string:nombre>/<int:edad>')
# rutas dinámicas más complejas
def test4(nombre=None, edad=None):
    if nombre and edad:
        return 'Hola {0} tienes {1} años.'.format(nombre, edad)
    elif nombre:
        return 'Hola, {}'.format(nombre)
    else:
        return 'Hola mundo'


# Metodo POST - no se puede acceder desde el browser
@app.route('/test5/new', methods=["POST"])
def test5_new():
    return 'Este URL recibe info de un POST'

   
from flask import request
@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        return 'Hemos accedido con POST'
    else:
        return 'Hemos accedido con GET'


#usar archivos estaticos como imagenes usando la funcion url_for
# Hay que crear un directoria de static/img
# # si estas dentro del contenedor de docker, usar para copiar imagenes del PC a contenedor:
# docker cp Desktop/a.png 76e52c080d3a:/root/flask/static/img/a.png


from flask import url_for
@app.route('/inicio')
def inicio():
    return '<img src="'+url_for('static', filename='img/a.png')+'"/>'


if __name__ == '__main__':
    app.run('0.0.0.0', 5000, debug=True)



