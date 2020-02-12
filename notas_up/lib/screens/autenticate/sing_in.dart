import 'package:flutter/material.dart';
import 'package:notas/screens/autenticate/register.dart';
import 'package:notas/services/auth.dart';

class SingIn extends StatefulWidget {
  final Function cambiarVista;
  SingIn({ this.cambiarVista });

  @override
  _SingInState createState() => _SingInState();
}

class _SingInState extends State<SingIn> {
  final AuthService _authService = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String pwd = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sing in en IFTS N° 11'),
        actions: <Widget>[
          FlatButton.icon(
              onPressed: () {
                widget.cambiarVista();
              },
              icon: Icon(Icons.person),
              label: Text('Registrarse')),
        ],
      ),
      body: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
          child: Form(
              child: Column(
              children: <Widget>[
                SizedBox(height: 20.0),
                TextFormField(
                  validator: (val) => val.isEmpty ? 'El usuario no puede estar vacio' : null,
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                  validator: (val) => val.length < 6 ? 'La clave debe tener mas de 6 caracteres' : null,
                  obscureText: true,
                  onChanged: (val) {
                    setState(() => pwd = val);
                  },
                ),
                SizedBox(height: 20.0),
                RaisedButton(
                  color: Colors.blue[300],
                  child: Text(
                    'Sing In',
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState.validate()) {
                      dynamic user = await _authService.singInWithUserAndPassword(email, pwd);

                      if (user == null) {
                        setState(() => error = 'Por favor ingrese un mail valido');
                      }
                    }
                  }
                ),
                SizedBox(height: 20.0),
                Text(
                  error, 
                  style: TextStyle(color: Colors.red[500], fontSize: 14.0),
                ),
              ],
          ))),
    );
  }
}
