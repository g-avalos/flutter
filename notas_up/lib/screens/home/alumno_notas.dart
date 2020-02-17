import 'package:flutter/material.dart';
import 'package:notas/models/alumno.dart';
import 'package:notas/screens/home/alumno_tile.dart';
import 'package:provider/provider.dart';

class AlumnosNotas extends StatefulWidget {
  AlumnosNotas({Key key}) : super(key: key);

  @override
  _AlumnosNotasState createState() => _AlumnosNotasState();
}

class _AlumnosNotasState extends State<AlumnosNotas> {
  @override
  Widget build(BuildContext context) {
    final alumnos = Provider.of<List<Alumno>>(context) ?? [];

    return ListView.builder(
      itemCount: alumnos.length,
      itemBuilder: (context, index) {
        return AlumnoTile(alumno: alumnos[index]);
      },
    );
  }
}