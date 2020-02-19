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
              mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text('Fecha cursada: ', style: textoFixed,),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(nota.fechaCursada, style: texto, ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text('Nota cursada: ', style: texto,),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(nota.notaCursada, style: texto,),
                  ],
                ), 
              ],
            ),
            (nota.notaFinal == '0') ? Text('') : Row(
              mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Text('Fecha final: ', style: textoFixed,),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(nota.fechaFinal, style: texto, ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text('Nota final: ', style: texto,),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Text(nota.notaFinal, style: texto,),
                  ],
                ), 
              ],
            ),
          ],
        ),
      ),
    );
  }
}