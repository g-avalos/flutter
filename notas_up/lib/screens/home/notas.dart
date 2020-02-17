import 'package:flutter/material.dart';
import 'package:notas/models/nota.dart';
import 'package:notas/screens/home/notas_tile.dart';

class Notas extends StatefulWidget {
  final List<Nota> notas;
  Notas({this.notas});

  @override
  _NotasState createState() => _NotasState();
}

class _NotasState extends State<Notas> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.notas.length,
      itemBuilder: (context, index) {
        return NotasTile(nota: widget.notas[index]);
      },
    );
  }
}