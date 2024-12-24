import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({super.key});
  File? image;
  final _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(onPressed: () {}, child: const Text('Upload image')),
            const SizedBox(
              height: 20,
            ),
            TextButton(onPressed: () {}, child: const Text('View image')),
          ],
        ),
      ),
    );
  }
}
