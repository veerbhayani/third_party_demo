import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:third_party_demo/file_picker_page_demo.dart';

class FilePickerDemo extends StatefulWidget {
  const FilePickerDemo({super.key});

  @override
  State<FilePickerDemo> createState() => _FilePickerDemoState();
}

class _FilePickerDemoState extends State<FilePickerDemo> {
  void openFile(PlatformFile file) {
    OpenFile.open(file.path!);
  }

  void openFiles(List<PlatformFile> files) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => FilesPage(
        files: files,
        onOpenedFile: openFile,
      ),
    ));
  }

  Future<File> saveFilePermanently(PlatformFile file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final newFile = File('${appStorage.path}/${file.name}');
    return File(file.path!).copy(newFile.path);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                final result = await FilePicker.platform.pickFiles(
                  allowMultiple: true,
                  type: FileType.custom,
                  allowedExtensions: ['pdf', 'mp4'],
                );
                if (result == null) return;
                //open single file
                final file = result.files.first;
                //openFile(file);
                openFiles(result.files);

                print('Name: ${file.name}');
                print('Bytes: ${file.bytes}');
                print('Size: ${file.size}');
                print('Extension: ${file.extension}');
                print('Path: ${file.path}');
                final newFile = await saveFilePermanently(file);
                print('From Path: ${file.path!}');
                print('To Path: ${newFile.path}');
              },
              child: const Icon(
                Icons.file_copy,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
