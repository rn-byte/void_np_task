import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImageController extends GetxController {
  File? image;
  XFile? pickedFile;

  final _picker = ImagePicker();
  RxBool showSpinner = false.obs;
  RxString imagePath = ''.obs;
  spinner(bool val) {
    showSpinner.value = val;
  }

  Future getImage() async {
    pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 80);
    if (pickedFile != null) {
      imagePath.value = pickedFile!.path.toString();
      image = File(pickedFile!.path);
    }
  }

  Future<void> uploadImage() async {
    if (image == null) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        const SnackBar(content: Text('Please select an image first.')),
      );
      return;
    }
    // Uint8List bytes = await pickedFile!.readAsBytes();
    try {
      var request = http.MultipartRequest(
          'POST', Uri.parse('https://api.escuelajs.co/api/v1/files/upload'));

      request.files.add(await http.MultipartFile.fromPath(
        'image', // Replace with your API field name
        image!.path,
      ));

      // Send the request
      var response = await request.send();

      print(response.statusCode);

      // Handle response
      if (response.statusCode == 201) {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          const SnackBar(content: Text('Image uploaded successfully!')),
        );
        print(response.stream.bytesToString());
      } else {
        ScaffoldMessenger.of(Get.context!).showSnackBar(
          SnackBar(
              content: Text(
                  'Failed to upload image. Status: ${response.statusCode}')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(Get.context!).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }
}
