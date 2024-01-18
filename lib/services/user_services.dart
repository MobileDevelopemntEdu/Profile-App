import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';

class UserServices {

  // firebase user instance Collection reference
  final  CollectionReference _userDB = FirebaseFirestore.instance.collection('users');



  // create user data
  Future<void> createUser(UserModel model) async {
    try {
      return await _userDB.doc(model.uid).set(model.toJson());
    } catch(e) {
      print(e.toString());
    }
  }



// get user data
  Future<UserModel?> getUser(String uid) async {
    try {
      DocumentSnapshot snapshot = await _userDB.doc(uid).get();
      return UserModel.fromJson(snapshot.data() as Map<String, dynamic>);
    } catch(e) {
      print(e.toString());
    }
    return null;
  }
















  // update user data
  Future<void> updateUser(UserModel model) async {
    try {
      return await _userDB.doc(model.uid).update(model.toJson());
    } catch(e) {
      print(e.toString());
    }
  }


}