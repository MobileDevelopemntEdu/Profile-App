
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  //firebase auth instance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  //sign in with email and password
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return result.user;
    } catch(e) {
      print(e.toString());
    }
    return null;
  }

  //register with email and password
  Future<User?> registerWithEmailAndPassword(String email, String password) async {
    try {
      var result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return result.user;
    } catch(e) {
      print(e.toString());
    }
    return null;
  }

  //sign out
  Future<void> signOut() async {
    try {
      return await _auth.signOut();
    } catch(e) {
      print(e.toString());
    }
  }

  //get current user
  Future<User?> getCurrentUser() async {
    try {
      return _auth.currentUser;
    } catch(e) {
      print(e.toString());
    }
    return null;
  }

  //get current user uid
  Future<String?> getCurrentUserUid() async {
    try {
      return _auth.currentUser?.uid;
    } catch(e) {
      print(e.toString());
    }
    return null;
  }
}


