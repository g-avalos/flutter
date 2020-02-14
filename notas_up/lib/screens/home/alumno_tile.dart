import 'package:flutter/material.dart';
import 'package:notas/models/alumno.dart';

class AlumnoTile extends StatelessWidget {
  final Alumno alumno;

  AlumnoTile({ this.alumno });

  @override
  Widget build(BuildContext context) {
    return Padding(
       padding: EdgeInsets.only(top: 8.0),
       child: Card(
          margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
          child: ListTile(
            leading: CircleAvatar(
              radius: 25,
              backgroundColor: Colors.brown[100],
            ),
            title: Text(alumno.nombre),
            subtitle: Text('Materias: ${alumno.aprobadas()} aprobadas - ${alumno.cursadas()} cursadas'),
          ),
       ),
    );
  }
}