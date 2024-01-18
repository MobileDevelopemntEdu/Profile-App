
import 'package:flutter/material.dart';
import 'package:profile_app/project_level_0/view/login_view.dart';

import '../repository/auth_repo.dart';
import 'home_view.dart';

class RegisterView extends StatelessWidget {
  RegisterView({super.key});

  final nameController = TextEditingController();
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
              const Center(child: Text("Register",style: TextStyle(fontSize:24.5 ),)),
               Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                      hintText: "Name & Surname"
                  ),
                ),
              ),

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
                    
                    // firesbae auth 
                    
                  final repo = AuthenticationRepository();

                  await repo.registerWithEmailAndPassword(nameController.text, emailController.text, passwordController.text)
                      .then((value) {

                    if(value != null){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> HomeView(uid: value.uid,)));
                    }else{
                      print("error");
                    }
                  });
                  }, child: const Text("Register")),
                ),
              ),


              TextButton(onPressed: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginView()));
              }, child: const Text("Login Here"))
            ],
          ),
        ),
      ),
    );
  }
}