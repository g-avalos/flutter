import firebase_admin
from firebase_admin import auth
from firebase_admin import credentials
from firebase_admin import firestore
from Google import Create_Service
import pandas
import numpy as np 

def getData(sheet):
    CLIENT_SECRET_FILE = 'credentials.json'
    API_SERVICE_NAME = 'sheets'
    API_VERSION = 'v4'
    SCOPES = ['https://www.googleapis.com/auth/spreadsheets.readonly']

    s = Create_Service(CLIENT_SECRET_FILE, API_SERVICE_NAME, API_VERSION, SCOPES)
    gs = s.spreadsheets()

    rows = gs.values().get(spreadsheetId=sheet, range='notas').execute()
    return rows.get('values')

def getDataFileFromFile(file):
    df = pandas.read_csv(file)
    df.fillna('', inplace=True)
    df = df.to_numpy().tolist()
    return df

#data = getData('1abDK78iGi_C51Z--tMAWV4SISATnpuy2vImOJeB4EdY')
data = getDataFileFromFile('Notas - notas.csv')

# Use a service account
cred = credentials.Certificate('ifts11notas-firebase-adminsdk-evg7d-26793f5162.json')
firebase_admin.initialize_app(cred)
db = firestore.client()

i = 0
d = data[i]
while d and i < len(data):
    if d[2] == 'Curso':
        continue

    mail = d[10]
    nombre = d[8]

    try:
        print("---> Creando: ", d[10])
        user = auth.create_user(email=mail, password='123456')
    except:
        print("---> Loggeando: ", d[10])
        user = auth.get_user_by_email(mail)

    alumno = {
        "dni": str(d[9]).replace('.0', ''),
        "nombre": d[8], 
        "mail": d[10], 
        "cohorte": str(d[6]).replace('.0', ''),
        "cuatrimestre_ingreso": str(d[7]).replace('.0', ''),
        "notas": []
        } 
    while d and mail == d[10]:
        nota = {
                "codigo": d[5],
                "nombre": d[4],
                "anio_cursada": str(d[1]).replace('.0', ''),
                "curso": d[2],
                "cuatrimestre": str(d[3]).replace('.0', ''),
                "condicion": d[12],
                "estado": d[18],
                "nota_cursada": str(d[13]).replace('.0', ''),
                "fecha_cursada": d[14],
                "nota_final": str(d[15]).replace('.0', ''),
                "fecha_final": d[16],
                "llamado": str(d[17]).replace('.0', '')
                }

        alumno['notas'].append(nota)

        i += 1

        if i >= len(data):
            break

        d = data[i]

    print("grabando: ", nombre)

    doc_ref = db.collection(u'alumnos').document(user.uid)
    doc_ref.set(alumno)
    print("grabo: ", nombre)

    print("=====> proximo: ", d[8])
