import 'package:flutter/material.dart';
import 'package:notas/models/nota.dart';


class NotasTile extends StatelessWidget {
  final Nota nota;
  NotasTile({ this.nota });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
          ),
          title: Text(nota.nombre),
          subtitle: Text(nota.notaFinal),
        ),
      ),
    );
  }
}