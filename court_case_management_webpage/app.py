from flask import Flask , render_template
from flask_dance.contrib.google import make_google_blueprint, google
import mysql.connector
from forms import Case , CaseUpdate , Hearing

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

app.config['SECRET_KEY'] = 'qwertyuiop'
blueprint = make_google_blueprint(client_id='',
        client_secret='',
        offline=True , scope= ['profile','email'])

app.register_blueprint(blueprint,url_prefix='/login')

@app.route("/")
def index():
    render_template("index.html")

@app.route('/login/google')
def login():
    if not google.authorized:
        return redirect(url_for("google.login"))
    resp = google.get("/oauth2/v1/userinfo")
    assert resp.ok, resp.text

    form = Case()
    #insert code for dynamically adding choices for both Lawyers
    if form.validate_on_submit():
        pass
        # insert code to add form data to db
            #remember to implement SESSION protocol for u_id

    sql = "SELECT id, fir_no FROM cases WHERE u_id ='"+resp.json()["id"]+"';"
    mycursor.execute(sql)
    cases = mycursor.fetchall()
    return render_template("profile.html",profile = resp.json()["profile"] ,cases = cases , form)

@blueprint.session.authorization_required
@app.route('/case/<cid>')
def case(cid):
    update =CaseUpdate()
    if update.validate_on_submit():
            #remember to implement SESSION protocol for c_id
        pass

    hform = Hearing()
    if hform.validate_on_submit():
            #remember to implement SESSION protocol for c_id
        pass

    sql = "SELECT * FROM cases WHERE id ="+cid+";"
    mycursor.execute(sql)
    case = mycursor.fetchall()
    sql = "SELECT * FROM hearings WHERE id ="+cid+";"
    mycursor.execute(sql)
    hearings= mycursor.fetchall()
    render_template("caseview.html", case = case ,hearings = hearings, update = update ,hform = hform )


@app.route('/search/<cid>')
def search(cid):
    # insert code to retrieve case details and Hearings
    sql = "SELECT * FROM cases WHERE id ="+cid+";"
    mycursor.execute(sql)
    case = mycursor.fetchall()
    sql = "SELECT * FROM hearings WHERE id ="+cid+";"
    mycursor.execute(sql)
    hearings= mycursor.fetchall()
    render_template("caseview.html" , case = case , hearing = hearing)





if __name__ == '__main__':
    app.run(debug=True)
