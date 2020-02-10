import 'package:flutter/material.dart';
import 'package:ifts11_notas/services/auth.dart';

class SingIn extends StatefulWidget {
  SingIn({Key key}) : super(key: key);

  @override
  _SingInState createState() => _SingInState();
}

class _SingInState extends State<SingIn> {

  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        backgroundColor: Colors.brown[400],
        elevation: 0.0,
        title: Text('Sing in IFTS N° 11'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        child: RaisedButton(
          child: Text('Sing In Anonimo'),
          onPressed: () async {
            dynamic user = await _authService.singInAnon();
            if (user == null) {
              print('Error');
            }
            else {
              print('Ok');
              print(user.uid);
            }
          },
        )
      ),
    );
  }
}