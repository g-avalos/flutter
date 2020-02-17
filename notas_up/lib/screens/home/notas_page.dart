import 'package:flutter/material.dart';
import 'package:notas/models/nota.dart';
import 'package:notas/screens/home/notas.dart';
import 'package:notas/services/auth.dart';

class NotasPage extends StatelessWidget {
  final List<Nota> notas;
  final AuthService _authService = AuthService();

  NotasPage({ this.notas });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Notas'),
          elevation: 0.0,
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                await _authService.singOut();
              }, 
              icon: Icon(Icons.person), 
              label: Text('Sing Out')
            ),
          ],
        ),
        body: Container(
          child: Notas(notas: notas,),
        ),
      );
  }
}
