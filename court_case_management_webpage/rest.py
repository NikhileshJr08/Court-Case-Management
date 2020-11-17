from flask_restful import Resource, Api
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

#################################
########  API classes  ##########
#################################

class  Caselist(Resource):

    def get(self,uid):   # Returns all the cases of that User id
        pass

    def post(self,uid):   # Used to add another case with User id
        pass

class Hearings(Resource):
    def get(self,cid):    # Returns all hearings of that Case id
        pass

    def post(self,cid):   # Used to add a hearing to a case
        pass

class Case(Resource):
    def get(self,cid):    # Returns the case details using Case id
        pass

    def patch(self,cid,verdict): # Used to update the verdict of a case
        pass

class Lawyers(Resource):
    def get(self):        # Returns all Lawyers
        pass
