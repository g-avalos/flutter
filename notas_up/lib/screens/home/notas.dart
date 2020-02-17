import 'package:flutter/material.dart';
import 'package:notas/models/alumno.dart';
import 'package:notas/screens/home/notas_tile.dart';

class Notas extends StatefulWidget {
  Alumno alumno;
  Notas({this.alumno});

  @override
  _NotasState createState() => _NotasState();
}

class _NotasState extends State<Notas> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.alumno.notas.length,
      itemBuilder: (context, index) {
        return NotasTile(nota: widget.alumno.notas[index]);
      },
    );
  }
}