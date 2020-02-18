import 'package:flutter/material.dart';
import 'package:notas/models/alumno.dart';
import 'package:notas/screens/home/notas.dart';

class NotasPage extends StatelessWidget {
  final Alumno alumno;

  NotasPage({ this.alumno });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Notas de: ${alumno.nombre}'),
          elevation: 0.0,
        ),
        body: Container(
          child: Notas(notas: alumno.notas,),
        ),
      );
  }
}
