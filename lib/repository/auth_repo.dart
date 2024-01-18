
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';
import '../services/auth_services.dart';
import '../services/user_services.dart';

class AuthenticationRepository {

  final AuthServices _authServices = AuthServices();

  final UserServices _userServices = UserServices();

  // sign in with email and password
  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      return await _authServices.signInWithEmailAndPassword(email, password);
    } catch(e) {
      print(e.toString());
    }
    return null;
  }

  //signup with email and password
  Future<User?> registerWithEmailAndPassword(String name, String email, String password) async {
       return await _authServices.registerWithEmailAndPassword(email, password).then((value) {
        if (value != null) {
          var model = UserModel(uid: value.uid, name: name, email: email);
          _userServices.createUser(model);
          return value;
        } else {
          return null;
        }
      });
  }

  //sign out
  Future<void> signOut() async {
    try {
      return await _authServices.signOut();
    } catch(e) {
      print(e.toString());
    }
  }

  //get current user
  Future<User?> getCurrentUser() async {
    try {
      return await _authServices.getCurrentUser();
    } catch(e) {
      print(e.toString());
    }
    return null;
  }


}
