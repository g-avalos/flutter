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

  String email;
  String pwd;

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
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
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
                    print(email);
                    print(pwd);
                  }),
            ],
          ))),
    );
  }
}
