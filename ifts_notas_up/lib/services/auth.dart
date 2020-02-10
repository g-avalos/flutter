import 'package:firebase_auth/firebase_auth.dart';
import 'package:ifts11_notas/models/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFormFBUser(FirebaseUser fbu) {
    return fbu != null ? User(uid: fbu.uid) : null;
  }

  Stream<User> get user {
    return _auth.onAuthStateChanged
      .map(_userFormFBUser);
  }

  Future singInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      return _userFormFBUser(result.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}