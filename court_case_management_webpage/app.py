from flask import Flask , render_template , redirect , url_for
from flask_login import logout_user , LoginManager
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
  'database': 'courthouse',
  'raise_on_warnings': True,
}

db = mysql.connector.connect(**config)
mycursor = db.cursor(buffered=True)

###################################

app = Flask(__name__)
api = Api(app)
#login_manager = LoginManager(app)

os.environ['OAUTHLIB_INSECURE_TRANSPORT'] = '1'
os.environ['OAUTHLIB_RELAX_TOKEN_SCOPE'] = '1'

app.config['SECRET_KEY'] = 'qwertyuiop'
blueprint = make_google_blueprint(client_id='198564324530-vlv26uhtdaps87bq00gsuom36q2h91dk.apps.googleusercontent.com',
        client_secret='hWyKUQ6XYcB_21y1XfL3NBsf',
        offline=True , scope= ['profile'])

app.register_blueprint(blueprint,url_prefix='/login')
api.add_resource(Caselist, '/clist/<string:uid>')
api.add_resource(Hearings,'/hearings/<string:cid>')
api.add_resource(casedetail, '/casedetail/<string:cid>')
api.add_resource(Lawyers,'/lawyers')

@app.route("/")
def index():
    if not google.authorized:
        auth = False
    else :
        auth = True
    return render_template("base.html" , auth = auth)

@app.route('/login/google')
def login():
    if not google.authorized:
        return redirect(url_for("google.login"))

@blueprint.session.authorization_required
@app.route("/logout")
def logout():
    logout_user()
    return redirect(url_for('index'))

@blueprint.session.authorization_required
@app.route('/profile' ,methods=['POST','GET'])
def profile():
    resp = google.get("/oauth2/v1/userinfo")
    assert resp.ok, resp.text

    form = Case()
    sql = "SELECT id , name FROM lawyers ;"
    mycursor.execute(sql)
    lawyers = mycursor.fetchall()
    form.prosecutor.choices = [(l[0],l[1]) for l in lawyers]
    form.defender.choices = [(l[0],l[1]) for l in lawyers]

    if form.validate_on_submit():

        sql = "INSERT INTO cases (u_id, party_name, p_id, defendant, d_id, fir_no, case_type, status, verdict) VALUES('"+resp.json()['id']+"','"+form.party_name.data+"','"+str(form.prosecutor.data)+"','"+form.defendant.data+"','"+str(form.defender.data)+"','"+form.fir_no.data+"','"+form.case_type.data+"','"+form.status.data+"','"+form.verdict.data+"');"
        mycursor.execute(sql)
        db.commit()
        #remember to implement SESSION protocol for u_id

    sql = "SELECT id,fir_no FROM cases WHERE u_id ='"+resp.json()['id']+"';"
    mycursor.execute(sql)
    cases = mycursor.fetchall()
    return render_template("profile2.html",profile = resp.json() ,result = cases , addform=form)

@blueprint.session.authorization_required
@app.route('/case/<cid>' ,methods=['POST','GET'])
def case(cid):
    update = CaseUpdate()
    if update.validate_on_submit():
        sql = "UPDATE cases SET status = '"+update.status.data+"', verdict = '"+update.verdict.data+"' WHERE id = '"+cid+"';"
        mycursor.execute(sql)
        db.commit()
        pass

    hform = Hearing()
    if hform.validate_on_submit():
        sql = "INSERT INTO hearings (date , judge, start ,end ,location, next_date, c_id ) VALUES ('"+str(hform.date.data)+"','"+hform.judge.data+"','"+str(hform.start.data)+"','"+str(hform.end.data)+"','"+hform.location.data+"','"+str(hform.next.data)+"','"+cid+"') ;"
        mycursor.execute(sql)
        db.commit()
        pass

    sql = "SELECT * FROM cases WHERE id ='"+cid+"';"
    mycursor.execute(sql)
    cases = mycursor.fetchall()
    sql = "SELECT * FROM hearings WHERE c_id ='"+cid+"';"
    mycursor.execute(sql)
    hearings= mycursor.fetchall()
    sql = "SELECT * FROM lawyers WHERE id ='"+str(cases[0][3])+"';"
    mycursor.execute(sql)
    x=mycursor.fetchall()
    l=[]
    l.append(x[0])
    sql = "SELECT * FROM lawyers WHERE id ='"+str(cases[0][5])+"';"
    mycursor.execute(sql)
    x=mycursor.fetchall()
    l.append(x[0])
    return render_template("caseView.html", cases = cases ,hearings = hearings, update = update ,hform = hform ,l=l)


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
