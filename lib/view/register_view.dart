import 'package:flutter/material.dart';
import 'package:profile_app/controller/auth_controller.dart';
import 'package:provider/provider.dart';

import 'home_view.dart';
import 'login_view.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final authController = Provider.of<AuthController>(context, listen: true);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.account_circle_outlined,
                    size: 40,
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Text(
                    'Profile App',
                    style: TextStyle(fontSize: 24.5),
                  )
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              ClipOval(
                child: Container(
                  width: 120.0,
                  height: 120.0,
                  child: Image.network(
                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Center(
                  child: Text(
                "Register",
                style: TextStyle(fontSize: 24.5),
              )),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: authController.nameController,
                  decoration: const InputDecoration(hintText: "Name & Surname"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: authController.emailController,
                  decoration: const InputDecoration(hintText: "Email"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: authController.passwordController,
                  decoration: const InputDecoration(hintText: "Password"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 50,
                  left: 20,
                  right: 20,
                  bottom: 10,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () async {
                          // `authController.register()` metodu, kullanıcının kayıt olma işlemini gerçekleştirir.
                          // Bu işlem asenkron bir işlem olduğu için, `await` anahtar kelimesi kullanılarak işlemin tamamlanması beklenir.
                        await authController.register().then((value) {
                          // Kayıt işlemi tamamlandığında, geriye bir değer döner. Bu değer genellikle kullanıcının benzersiz kimliği (uid) olur.
                          // Eğer dönen değer `null` değilse, bu kullanıcının başarıyla kayıt olduğu anlamına gelir.
                          if (value != null) {
                            // Kullanıcı başarıyla kayıt olduktan sonra, kullanıcıyı ana sayfaya yönlendiririz.
                            // Bu işlem için Flutter'da `Navigator` sınıfının `pushReplacement` metodu kullanılır.
                            // Bu metod, mevcut sayfayı yeni bir sayfa ile değiştirir ve geri dönüş yolunu kapatır.
                            // Yeni sayfanın oluşturulması için `MaterialPageRoute` kullanılır ve kullanıcının uid'si yeni sayfaya parametre olarak geçilir.
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomeView(
                                          uid: value,
                                        )));
                          }
                        });
                      },
                      child: const Text("Register")),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginView()));
                  },
                  child: const Text("Login Here"))
            ],
          ),
        ),
      ),
    );
  }
}
