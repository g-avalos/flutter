import 'package:flutter/material.dart';
import 'package:notas/models/alumno.dart';
import 'package:notas/screens/home/alumno_notas.dart';
import 'package:notas/services/auth.dart';
import 'package:notas/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
 final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Alumno>>.value(
        value: DatabaseService().alumnos,
        child: Scaffold(
        backgroundColor: Colors.brown[50],
        appBar: AppBar(
          title: Text('Home'),
          elevation: 0.0,
          backgroundColor: Colors.brown[400],
          actions: <Widget>[
            FlatButton.icon(
              onPressed: () async {
                await _authService.singOut();
              }, 
              icon: Icon(Icons.person), 
              label: Text('Sing Out')
            )
          ],
        ),
        body: AlumnosNotas(),
      ),
    );
  }
}