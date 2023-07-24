import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerDemo extends StatefulWidget {
  const ImagePickerDemo({super.key});

  @override
  State<ImagePickerDemo> createState() => _ImagePickerDemoState();
}

class _ImagePickerDemoState extends State<ImagePickerDemo> {
  File? file;
  Future<void> selectImageFromGallary() async {
    ImagePicker pickImageData = ImagePicker();
    XFile? xFile = await pickImageData.pickImage(
      source: ImageSource.gallery,
    );
    file = (xFile != null) ? File(xFile.path) : null;
    setState(() {});
  }

  Future<void> selectImageFromCamara() async {
    ImagePicker pickImageData = ImagePicker();
    XFile? xFile = await pickImageData.pickImage(source: ImageSource.camera);
    file = File(xFile!.path);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 100,
              backgroundImage: (file != null)
                  ? FileImage(file!)
                  : const NetworkImage(
                      'https://images.unsplash.com/photo-1690070416537-fb5e0aab54c0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxlZGl0b3JpYWwtZmVlZHw3fHx8ZW58MHx8fHx8&auto=format&fit=crop&w=500&q=60',
                    ) as ImageProvider,
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                selectImageFromGallary();
                setState(() {});
              },
              color: Colors.blue,
              child: const Text(
                'Upload From Gallary',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: () {
                selectImageFromCamara();
                setState(() {});
              },
              color: Colors.blue,
              child: const Text(
                'Take Picture',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
