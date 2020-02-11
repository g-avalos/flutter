import 'package:flutter/material.dart';
import 'package:notas/screens/autenticate/sing_in.dart';

class Autenticate extends StatefulWidget {
  Autenticate({Key key}) : super(key: key);

  @override
  _AutenticateState createState() => _AutenticateState();
}

class _AutenticateState extends State<Autenticate> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: SingIn(),
    );
  }
}