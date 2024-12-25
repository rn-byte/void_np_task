import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:void_task_app/controller/image_controller.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ImageController());
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: Obx(
        () {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.getImage();
                  },
                  child: CircleAvatar(
                    radius: 90,
                    backgroundImage: controller.imagePath.isNotEmpty
                        ? FileImage(File(controller.imagePath.toString()))
                        : null,
                  ),
                ),
                const SizedBox(
                  height: 80,
                ),
                TextButton(
                    onPressed: () {
                      controller.uploadImage();
                    },
                    child: const Text('Upload Image'))
              ],
            ),
          );
        },
      ),
    );
  }
}
