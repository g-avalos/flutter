
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:notas/models/alumno.dart';
import 'package:notas/models/nota.dart';

class DatabaseService {
  final String uid;
  final String mail;

  DatabaseService({ this.uid, this.mail });

  final CollectionReference notas = Firestore.instance.collection('alumnos');

  Future crearDatosIniciales() async {
    Alumno a = Alumno();

    return await notas.document(uid).setData({
        "dni": a.dni,
        "nombre": a.nombre, 
        "mail": mail, 
        "cohorte": a.cohorte,
        "cuatrimestre_ingreso": a.cuatrimestreIngreso,
        "notas": a.notas
      });
  }

  Future getData() async {
    return await notas.document(uid).get();
  }

  Future updateAlumno(Alumno a) async {
    return await notas.document(uid).setData({
      'nombre': a.nombre,
      'dni': a.dni,
    });
  }
  
  Stream<List<Alumno>> get alumnos {
    return notas.snapshots().map(_alumnosFromSnapshot);
  }

  Stream<Alumno> get alumno {
    return notas.document(uid).snapshots().map(_toAlumno);
  }

  List<Alumno> _alumnosFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map(_toAlumno).toList();
  }
  
  Alumno _toAlumno(DocumentSnapshot doc) {
    final Map <String, dynamic> d = doc.data;

    Alumno a;

    try {
      a = Alumno(
        cohorte: d['cohorte'] ?? '',
        cuatrimestreIngreso: d['cuatrimestre_ingreso'] ?? '',
        dni: d['dni'] ?? '',
        mail: d['mail'] ?? '',
        nombre: d['nombre'] ?? '',
        notas: [],
      );

      var notas = d['notas'] ?? [];
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
    } catch (e) {
      a = Alumno();
      print(e);
    }

    return a;
  }
}