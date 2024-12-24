import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:void_task_app/controller/login_controller.dart';
import 'package:void_task_app/screen/dashboard.dart';
import 'package:void_task_app/screen/sign_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            ),
            TextFormField(
              controller: controller.usernameController.value,
              decoration: const InputDecoration(
                label: Text('Enter Your Username'),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: controller.passwordController.value,
              decoration:
                  const InputDecoration(label: Text('Enter your Password ')),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
                width: 200,
                child: ElevatedButton(
                    onPressed: () {
                      controller.login();
                      //Get.to(() => DashboardScreen());
                    },
                    child: const Text('Login')))
          ],
        ),
      ),
    );
  }
}
