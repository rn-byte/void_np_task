import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:void_task_app/controller/signup_controller.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final signupController = Get.put(SignupController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Signup Screen"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            TextFormField(
              controller: signupController.usernameController.value,
              decoration: const InputDecoration(
                label: Text('Enter Your Username'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: signupController.passwordController.value,
              decoration: const InputDecoration(
                  label: Text('Enter your Password '),
                  suffixIcon: Icon(Icons.password)),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed: () {
                      signupController.signUp();
                    },
                    child: const Text('Sign up')))
          ],
        ),
      ),
    );
  }
}
