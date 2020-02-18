import 'package:flutter/material.dart';
import 'package:notas/models/alumno.dart';
import 'package:notas/screens/home/alumnos.dart';
import 'package:notas/screens/home/settings_form.dart';
import 'package:notas/screens/home/settings_page.dart';
import 'package:notas/services/auth.dart';
import 'package:notas/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
 final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettings() {
      showDialog(context: context, builder: (context) {
        return AlertDialog(
          content: FormSettings(),
        );
      });
    }

    return StreamProvider<List<Alumno>>.value(
        value: DatabaseService().alumnos,
        child: Scaffold(
        appBar: AppBar(
          title: Text('I.F.T.S. N° 11'),
          elevation: 0.0,
        ),
        drawer: Drawer(
          child: ListView(
            children: <Widget>[
              ListTile(
                title: Text("Menu"),
              ),
              Divider(),
              ListTile(
                  title: Text("Perfil"),
                  leading: Icon(Icons.person),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingsPage(),
                      )
                    );
                  }
                ),
              Divider(),
              ListTile(
                  title: Text("Salir"),
                  leading: Icon(Icons.exit_to_app),
                  onTap: () async {
                    await _authService.singOut();
                  }, 
                ),
            ],
          ),
        ),
        body: Container(
          child: Alumnos(),
        ),
      ),
    );
  }
}