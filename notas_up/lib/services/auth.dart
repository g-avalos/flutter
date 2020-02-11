import 'package:firebase_auth/firebase_auth.dart';
import 'package:notas/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFormFBUser(FirebaseUser fbu) {
    return fbu != null ? User(uid: fbu.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged
      .map(_userFormFBUser);
  }

  //SingIn anonimo
  Future singInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      return _userFormFBUser(result.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  // Singout
  Future singOut() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //Registro con mail y clave
  Future registerWithUserAndPassword(String email, String pwd) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: pwd);
      return _userFormFBUser(result.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}