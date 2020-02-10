import 'package:flutter/material.dart';
import 'package:ifts11_notas/models/user.dart';
import 'package:ifts11_notas/screens/home/home.dart';
import 'package:ifts11_notas/screens/autenticate/autenticate.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<User>(context);

    print(user);
    
    return Container(
      child: Autenticate(),
    );
  }
}