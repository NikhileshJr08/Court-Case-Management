from flask import Flask , render_template
import mysql.connector
#################################
###### Database Connection ######
#################################
config = {
  'user': 'root',
  'password': '',
  'host': 'localhost',
  'database': 'hospital',
  'raise_on_warnings': True,
}

db = mysql.connector.connect(**config)
mycursor = db.cursor(buffered=True)

###################################

app = Flask(__name__)
api = Api(app)

@app.route("/")
def index():
    render_template("index.html")





if __name__ == '__main__':
    app.run(debug=True)
