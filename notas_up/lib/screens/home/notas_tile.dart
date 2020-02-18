import 'package:flutter/material.dart';
import 'package:notas/models/nota.dart';
import 'package:notas/shared/decoration.dart';

class NotasTile extends StatelessWidget {
  final Nota nota;
  NotasTile({ this.nota });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
//        color: (nota.curso == 'Primero') ? Colors.brown[300] : (nota.curso == 'Segundo') ? Colors.yellow[300] : Colors.blue[300],
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            ListTile(
              title: Text(nota.nombre, style: titulo),
              subtitle: Text(nota.curso, style: subtitulo,),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text('Fecha cursada: ', style: texto,),
                        Text(nota.fechaCursada, style: texto,),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text('Nota cursada: ', style: texto,),
                          Text(nota.notaCursada, style: texto,), 
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text('Fecha final: ', style: texto,),
                        Text(nota.fechaFinal, style: texto,),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Text('Nota final: ', style: texto,),
                          Text(nota.notaFinal, style: texto,), 
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}