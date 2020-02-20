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
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Text('Fecha cursada: ', style: texto,),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(nota.fechaCursada, style: texto, ),
                  ),  
                  Expanded(
                    flex: 4,
                    child: Text('Nota cursada: ', style: texto,),
                  ),  
                  Expanded(
                    flex: 2,
                    child: Text(nota.notaCursada, style: texto,),
                  ),  
                ],
              ),
            ),
            (nota.notaFinal == '0') ? Text('') : Padding(
              padding: const EdgeInsets.fromLTRB(15, 2, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Expanded(
                    flex: 4,
                    child: Text('Fecha final: ', style: texto,),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(nota.fechaFinal, style: texto, ),
                  ),  
                  Expanded(
                    flex: 4,
                    child: Text('Nota final: ', style: texto,),
                  ),  
                  Expanded(
                    flex: 2,
                    child: Text(nota.notaFinal, style: texto,),
                  ),  
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}