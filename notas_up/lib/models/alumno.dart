import 'package:notas/models/nota.dart';

class Alumno {
  String cohorte;
  String cuatrimestreIngreso;
  String dni;
  String mail;
  String nombre;
  List<Nota> notas;

  Alumno({this.cohorte, this.cuatrimestreIngreso, this.dni, this.mail, this.nombre, this.notas });

  int aprobadas() {
    return notas.where((n) => n.condicion == "Promoción" || n.condicion == "Final").toList().length;
  }

  int cursadas() {
    return notas.where((n) => n.condicion == "Cursada").toList().length;
  }
}
