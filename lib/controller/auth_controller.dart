import 'package:flutter/material.dart';
import '../repository/auth_repo.dart';

/// `AuthController` bir sınıftır ve kullanıcı kimlik doğrulama işlemlerini yönetir.
/// Gerçek kimlik doğrulama işlemlerini gerçekleştirmek için `AuthenticationRepository`'i kullanır.
/// Tepkisel durum yönetimi sağlamak için `ChangeNotifier`'ı genişletir.
class AuthController extends ChangeNotifier {

  // AuthenticationRepository sınıfının bir örneği.
  final repo = AuthenticationRepository();

  //doğrulama formlarındaki kullanıcı girişini işlemek için TextEditingControllers.
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  /// Yeni bir kullanıcı kaydetmek için metod.
  /// Kullanıcıyı kaydetmek için `AuthenticationRepository`'den `registerWithEmailAndPassword` metodunu kullanır.
  /// Kayıt başarılı olursa, kullanıcının UID'sini döndürür.
  /// Kayıt başarısız olursa, bir hata mesajı yazdırır ve null döndürür.
  Future<String?> register() async {
    return  await repo.registerWithEmailAndPassword(nameController.text, emailController.text, passwordController.text)
        .then((value) {
      if(value != null){
        return value.uid;
      }else{
        print("hata");
      }
      return null;
    });

  }

  /// Mevcut bir kullanıcının oturum açması için metod.
  /// Kullanıcının oturum açması için `AuthenticationRepository`'den `signInWithEmailAndPassword` metodunu kullanır.
  /// Oturum açma başarılı olursa, kullanıcının UID'sini döndürür.
  /// Oturum açma başarısız olursa, bir hata mesajı yazdırır ve null döndürür.
  Future<String?> login() async {
    return await repo.signInWithEmailAndPassword(emailController.text,  passwordController.text).then((value) {
      if(value != null){
        return value.uid;
      }else{
        print("hata");
      }
      return null;
    });

  }
}