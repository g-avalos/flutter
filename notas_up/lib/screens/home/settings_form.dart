import 'package:flutter/material.dart';
import 'package:notas/models/alumno.dart';
import 'package:notas/models/user.dart';
import 'package:notas/services/database.dart';
import 'package:notas/shared/decoration.dart';
import 'package:provider/provider.dart';

class FormSettings extends StatefulWidget {
  FormSettings({Key key}) : super(key: key);

  @override
  _FormSettingsState createState() => _FormSettingsState();
}

class _FormSettingsState extends State<FormSettings> {
  final _formKey = GlobalKey<FormState>();
  String _currentName;
  String _currentDni;
  
  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);

    return StreamBuilder<Alumno>(
      stream: DatabaseService(uid: user.uid).alumno,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }

        Alumno alumno = snapshot.data;

        return Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(height: 10),
              Text("Nombre"),
              SizedBox(height: 10),
              TextFormField(
                initialValue: alumno.nombre,
                decoration: textDecoration.copyWith(hintText: 'Nombre'),
                validator: (val) {
                  return val.isEmpty ? 'Ingresa tu nombre' : null;
                },
                onChanged: (val) {
                  setState(() => _currentName = val);
                },
              ), 
              SizedBox(height: 20),
              TextFormField(
                initialValue: alumno.dni,
                decoration: textDecoration.copyWith(hintText: 'D.N.I.'),
                validator: (val) {
                  return val.isEmpty ? 'Ingresa tu D.N.I.' : null;
                },
                onChanged: (val) {
                  setState(() => _currentDni = val);
                },
              ), 
              SizedBox(height: 20),
              RaisedButton(
                child: Text('Guardar', ),
                onPressed: () async {
                  if (_formKey.currentState.validate()) {
                    alumno.dni = _currentDni ?? alumno.dni;
                    alumno.nombre = _currentName ?? alumno.nombre;
                    await DatabaseService(uid: user.uid).updateAlumno(alumno);
                    Navigator.pop(context);
                  }
                }
              ),
            ],
          )
        );
      }
    );
  }
}