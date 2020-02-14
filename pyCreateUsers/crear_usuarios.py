import pyrebase
from Google import Create_Service
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore

def getData(sheet):
    CLIENT_SECRET_FILE = 'credentials.json'
    API_SERVICE_NAME = 'sheets'
    API_VERSION = 'v4'
    SCOPES = ['https://www.googleapis.com/auth/spreadsheets.readonly']

    s = Create_Service(CLIENT_SECRET_FILE, API_SERVICE_NAME, API_VERSION, SCOPES)
    gs = s.spreadsheets()

    rows = gs.values().get(spreadsheetId=sheet, range='Alumnos').execute()
    return rows.get('values')

data = getData('1Q8RRq7aXU4fN34bLatDUKg6TBQPrtNZTy5qICHCjqPA')
data.extend(getData('1K82iUvBONREmiQR7GGjtmmVljOY4JmfSM3mUZ4WeyoE'))

config = {  
    "apiKey": "AIzaSyA8ruEHNqqh7KYTquY7u2bhAglHeOhe9mI", 
    "authDomain": "ifts11notas.firebaseapp.com", 
    "databaseURL": "https://ifts11notas.firebaseio.com",  
    "storageBucket": "ifts11notas.appspot.com",  
    "serviceAccount": "ifts11notas-firebase-adminsdk-evg7d-26793f5162.json" 
} 
  
firebase = pyrebase.initialize_app(config)
detachedAuth = firebase.auth();

#for d in data:
#    if d[6] != "Nom_Usuario" :
#        print(d[6])
#        print(d[7])
    #detachedAuth.create_user_with_email_and_password(d[6], d[7]);
try:
    user = detachedAuth.create_user_with_email_and_password('test3@test.com', '123456')
except:
    user = detachedAuth.sign_in_with_email_and_password('test3@test.com', '123456')

alumno = {
    "id": user['localId'],
    "nombre": "Sterling Archer", 
    "notas": [{
        "nombre": "PP 1",
        "estado": "Cursando",
        "nota_cursada": None,
        "fecha_cursada": None,
        "nota_final": None,
        "fecha_aprobada": None
    }]
} 

# Use a service account
cred = credentials.Certificate('ifts11notas-firebase-adminsdk-evg7d-26793f5162.json')
firebase_admin.initialize_app(cred)

db = firestore.client()
print(db)
doc_ref = db.collection(u"notas").document(user['idToken'])
print(doc_ref)
doc_ref.set(alumno)
