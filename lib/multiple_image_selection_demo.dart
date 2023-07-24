import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MultipleImageSelectionDemo extends StatefulWidget {
  const MultipleImageSelectionDemo({super.key});

  @override
  State<MultipleImageSelectionDemo> createState() =>
      _MultipleImageSelectionDemoState();
}

class _MultipleImageSelectionDemoState
    extends State<MultipleImageSelectionDemo> {
  List<File> files = [];
  Future<void> selectMultipleImages() async {
    ImagePicker pickImageData = ImagePicker();
    List<XFile> images = await pickImageData.pickMultiImage();
    for (var element in images) {
      files.add(
        File(
          element.path,
        ),
      );
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            MaterialButton(
              onPressed: () async {
                await selectMultipleImages();
              },
              color: Colors.blue,
              child: const Text(
                'Pick Images',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: GridView.builder(
                itemCount: files.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return SizedBox(
                    height: 200,
                    width: 150,
                    child: Image(
                      image: FileImage(files[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
