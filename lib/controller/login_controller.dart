import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart';

import '../screen/dashboard.dart';

class LoginController extends GetxController {
  final usernameController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  void login() async {
    try {
      final response = await post(
        Uri.parse('https://interview-mock-api.onrender.com/login'),
        body: {
          'username': usernameController.value.text,
          'password': passwordController.value.text,
        },
      );
      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        debugPrint('Login Successfull');
        Get.to(() => DashboardScreen());
        debugPrint(data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
