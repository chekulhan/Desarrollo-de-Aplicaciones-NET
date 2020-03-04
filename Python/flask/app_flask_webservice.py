from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/')

def hello_world():
    return '<h2>Hello world</h2>'

@app.route('/test1')
def test_function():
    return '<h1>Test1 from flask</h1>'


@app.route('/test3/<int:id>')
#@app.route('/test3/<id>') - mas sencillo
def test2(id):
    return '<h1>Test3 from flask con id:{} </h1>'.format(id)

@app.route('/users')
def getUsers():
    #get usuarios de la base de datos en formato JSON
    users = [
    {
        'id': 1,
        'title': u'Buy groceries',
        'description': u'Milk, Cheese, Pizza, Fruit, Tylenol', 
        'done': False
    },
    {
        'id': 2,
        'title': u'Learn Python',
        'description': u'Need to find a good Python tutorial on the web', 
        'done': False
    }
    ]

    return jsonify({'users': users})

@app.route('/usertext')
def getUsersText():
    #get usuarios de la base de datos en formato JSON
    s = """
    {
        'id': 1,
        'title': u'Buy groceries',
        'description': u'Milk, Cheese, Pizza, Fruit, Tylenol', 
        'done': False
    },
    {
        'id': 2,
        'title': u'Learn Python',
        'description': u'Need to find a good Python tutorial on the web', 
        'done': False
    }
 """

    
    return s

if __name__ == '__main__':
    app.run(debug=True)