from flask_wtf import FlaskForm
from wtforms import IntegerField,StringField,SubmitField,SelectField,TextField,TimeField, DateField
from wtforms.validators import InputRequired , Length

class Case(FlaskForm):
    party_name = StringField("Party name:" , validators=[InputRequired() , Length(max=20) ])
    prosecutor = SelectField("Prosecution Lawyer" , coerce = int, validators=[InputRequired()])
    defendant = StringField("Defendant: " , validators=[InputRequired() , Length(max=20) ])
    defender =  SelectField("Defense Lawyer" , coerce = int , validators=[InputRequired()])
    fir_no = IntegerField("Fir No:" , validators=[InputRequired() ,  Length(max=20) ] )
    case_type = StringField("Case type:" ,validators=[InputRequired() ,  Length(max=20) ] )
    status =  StringField("Case Status:" , validators=[InputRequired() ,  Length(max=20) ] )
    verdict = TextField("Verdict:")

class Hearing(FlaskForm):
    date = DateField("Date (yyyy-mm-dd):" , validators=[InputRequired()] )
    judge =  StringField("Judge:" , validators=[InputRequired() ,  Length(max=20) ])
    start = TimeField("Start time",validators=[InputRequired()])
    end = TimeField("End time",validators=[InputRequired()])
    location = StringField("Location :" , validators=[InputRequired() ,  Length(max=20) ])
    next = DateField("Next hearing (yyyy-mm-dd) :" )

class CaseUpdate(FlaskForm):
    status =  StringField("Case Status:" , validators=[InputRequired() ,  Length(max=20) ] )
    verdict = TextField("Verdict:" , validators=[InputRequired()])
