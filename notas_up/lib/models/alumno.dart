import 'package:notas/models/nota.dart';

class Alumno {
  String cohorte = '';
  String cuatrimestreIngreso = '';
  String dni = '';
  String mail = '';
  String nombre = '';
  List<Nota> notas = [];

  Alumno({this.cohorte, this.cuatrimestreIngreso, this.dni, this.mail, this.nombre, this.notas });

  int aprobadas() {
    try {
      return notas.where((n) => n.condicion == "Promoción" || n.condicion == "Final").toList().length;
    } catch (e) {
      print(e);
    }

    return 0;
  }

  int cursadas() {
    try {
      return notas.where((n) => n.condicion == "Cursada").toList().length;
    } catch (e) {
      print(e);
    }

    return 0;
  }
}
