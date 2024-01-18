import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'home_view.dart';
import 'register_view.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                  Icon(Icons.account_circle_outlined,size: 40,),
                  SizedBox(
                    width: 12,
                  ),
                  Text('Profile App',style: TextStyle(fontSize:24.5 ),)
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
              const Center(child: Text("Login",style: TextStyle(fontSize:24.5 ),)),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: emailController,
                  decoration: const InputDecoration(
                      hintText: "Email"
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                      hintText: "Password"
                  ),
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
                  child: ElevatedButton(onPressed:() async {
                    print("Burada");
                    final FirebaseAuth _auth = FirebaseAuth.instance;

                    var result = await _auth.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text).then((value) =>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeView(uid: value.user!.uid,))) );
                    print(result);
                  }, child: const Text("Login")),
                ),
              ),


              TextButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> RegisterView()));
              }, child: const Text("Register Here"))
            ],
          ),
        ),
      ),
    );
  }
}