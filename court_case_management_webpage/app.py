from flask import Flask , render_template
import os
from flask_dance.contrib.google import make_google_blueprint, google
import mysql.connector
from forms import Case , CaseUpdate , Hearing
from rest import Caselist ,Hearings , casedetail , Lawyers
from flask_restful import Api
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
os.environ['OAUTHLIB_INSECURE_TRANSPORT'] = '1'
os.environ['OAUTHLIB_RELAX_TOKEN_SCOPE'] = '1'

app.config['SECRET_KEY'] = 'qwertyuiop'
blueprint = make_google_blueprint(client_id='198564324530-vlv26uhtdaps87bq00gsuom36q2h91dk.apps.googleusercontent.com',
        client_secret='hWyKUQ6XYcB_21y1XfL3NBsf',
        offline=True , scope= ['profile','email','openid'])

app.register_blueprint(blueprint,url_prefix='/login')
api.add_resource(Caselist, '/clist/<string:uid>')
api.add_resource(Hearings,'/hearings/<string:cid>')
api.add_resource(casedetail, '/casedetail/<string:cid>')
api.add_resource(Lawyers,'/lawyers')
@app.route("/")
def index():
    return render_template("base.html")

@app.route('/login/google')
def login():
    if not google.authorized:
        return redirect(url_for("google.login"))
    resp = google.get("/oauth2/v1/userinfo")
    assert resp.ok, resp.text

    form = Case()
    sql = "SELECT id , name FROM lawyers ;"
    mycursor.execute(sql)
    lawyers = mycursor.fetchall()
    form.prosecutor.choices = lawyers
    form.defender.choices = lawyers

    if form.validate_on_submit():

        sql = "INSERT INTO cases (u_id, party_name, prosecutor, defendant, defender, fir_no, case_type, status, verdict) VALUES('"+ +"','"+form.party_name.data+"','"+form.prosecutor.data+"','"+form.defendant.data+"','"+form.defender.data+"','"+form.fir_no.data+"','"+form.case_type.data+"','"+form.status.data+"','"+form.verdict.data+"');"
        mycursor.execute(sql)
        db.commit()
        #remember to implement SESSION protocol for u_id

    sql = "SELECT id, fir_no FROM cases WHERE u_id ='"+resp.json()["Id"]+"';"
    mycursor.execute(sql)
    cases = mycursor.fetchall()
    return render_template("profile.html",profile = resp.json()["profile"] ,result = cases , form=form)

@blueprint.session.authorization_required
@app.route('/case/<cid>' ,)
def case(cid):
    update = CaseUpdate()
    if update.validate_on_submit():
        sql = "UPDATE cases SET status = '"+update.status.data+"' verdict = '"+update.verdict.data+"' WHERE c_id = "+cid+";"
        mycursor.execute(sql)
        db.commit()
        pass

    hform = Hearing()
    if hform.validate_on_submit():
        sql = "INSERT INTO hearings (date , judge, start ,end ,location, next, c_id ) VALUES ('"+hform.date.data+"','"+hform.judge.data+"','"+hform.start.data+"','"+hform.end.data+"','"+hform.location.data+"','"+hform.next.data+"','"+cid+"') ;"
        mycursor.execute(sql)
        db.commit()
        pass

    sql = "SELECT * FROM cases WHERE id ='"+cid+"';"
    mycursor.execute(sql)
    cases = mycursor.fetchall()
    sql = "SELECT * FROM hearings WHERE cid ='"+cid+"';"
    mycursor.execute(sql)
    hearings= mycursor.fetchall()
    return render_template("caseview.html", cases = cases ,hearings = hearings, update = update ,hform = hform )


@app.route('/search/<cid>')
def search(cid):
    # code to retrieve case details and Hearings
    sql = "SELECT * FROM cases WHERE id ='"+cid+"';"
    mycursor.execute(sql)
    cases = mycursor.fetchall()
    sql = "SELECT * FROM hearings WHERE cid ='"+cid+"';"
    mycursor.execute(sql)
    hearings= mycursor.fetchall()
    return render_template("caseview.html" , cases = cases , hearing = hearing)



if __name__ == '__main__':
    app.run(debug=True)
