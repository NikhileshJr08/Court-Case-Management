from flask_restful import Resource
import mysql.connector
from json import dumps , loads
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
cursor = db.cursor(buffered=True , dictionary = True)

#################################
########  API classes  ##########
#################################

class  Caselist(Resource):

    def get(self,uid):   # Returns all the cases of that User id
        sql = "SELECT id, fir_no FROM cases WHERE u_id ="+uid+";"
        cursor.execute(sql)
        cases = cursor.fetchall()
        cases = dumps(cases)
        return cases

    def post(self,uid):   # Used to add another case with User id
        pass
class Hearings(Resource):
    def get(self,cid):    # Returns all hearings of that Case id
        sql = "SELECT * FROM hearings WHERE cid ="+cid+";"
        cursor.execute(sql)
        hearings= cursor.fetchall()
        hearings = dumps(hearings)
        return hearings

    def post(self,cid):   # Used to add a hearing to a case
        sql = "INSERT INTO hearings (date , judge, start ,end ,location, next, c_id ) VALUES ( ) ;"
        cursor.execute(sql)
        db.commit()
        pass

class casedetail(Resource):
    def get(self,cid):    # Returns the case details using Case id
        sql = "SELECT * FROM cases WHERE id ="+cid+";"
        cursor.execute(sql)
        case = cursor.fetchall()
        case = dumps(case)
        return case

    def patch(self,cid): # Used to update the verdict of a case
        sql = "UPDATE cases SET status = '"++"' verdict = '"++"' WHERE c_id = "++";"
        cursor.execute(sql)
        db.commit()

class Lawyers(Resource):
    def get(self):        # Returns all Lawyers
        sql = "SELECT id , name FROM lawyers ;"
        cursor.execute(sql)
        lawyers = cursor.fetchall()
        lawyers= dumps(lawyers)
        return lawyers
