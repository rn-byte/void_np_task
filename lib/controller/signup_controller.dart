import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:http/http.dart';

class SignupController extends GetxController {
  final usernameController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  void signUp() async {
    try {
      final response = await post(
          Uri.parse('https://interview-mock-api.onrender.com/signup'),
          body: {
            'username': usernameController.value.text,
            'password': passwordController.value.text,
          });

      var data = jsonDecode(response.body);
      if (response.statusCode == 200) {
        debugPrint('Sign up Successfull');
        debugPrint(data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }
}
