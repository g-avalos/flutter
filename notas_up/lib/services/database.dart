
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notas/models/alumno.dart';
import 'package:notas/models/nota.dart';

class DatabaseService {
  final String uid;
  final String mail;

  DatabaseService({ this.uid, this.mail });

  final CollectionReference notas = Firestore.instance.collection('alumnos');

  Future crearDatosIniciales() async {
    return await notas.document(uid).setData({
        "dni": '',
        "nombre": '', 
        "mail": mail, 
        "cohorte": '2020',
        "cuatrimestre_ingreso": '1',
        "notas": []
        });
  }

  Future getData() async {
    return await notas.document(uid).get();
  }

  Stream<List<Alumno>> get alumnos {
    return notas.snapshots().map(_alumnosFromSnapshot);
  }

  List<Alumno> _alumnosFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      final Map <String, dynamic> d = doc.data;

      Alumno a = Alumno(
        cohorte: d['cohorte'] ?? 0,
        cuatrimestreIngreso: d['cuatrimestre_ingreso'] ?? '',
        dni: d['dni'] ?? '',
        mail: d['mail'] ?? '',
        nombre: d['nombre'] ?? '',
        notas: [],
      );

      var notas = d['notas'];
      if (notas != null && notas.length != 0) {
        for (var n in notas) {
          a.notas.add(Nota(
            anioCursada: n['amio_cursada'] ?? '',
            codigo: n['codigo'] ?? '',
            condicion: n['condicion'] ?? '',
            cuatrimestre: n['cuatrimestre'] ?? '',
            curso: n['curso'] ?? '',
            estado: n['estado'] ?? '',
            fechaCursada: n['fecha_cursada'] ?? '',
            fechaFinal: n['fecha_final'] ?? '',
            llamado: n['llamado'] ?? '',
            nombre: n['nombre'] ?? '',
            notaCursada: n['nota_cursada'] ?? '',
            notaFinal: n['nota_final'] ?? '',
            )
          );
        }
      }
      return a;
    }).toList();
  }
}