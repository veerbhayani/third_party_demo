import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:video_player/video_player.dart';

class VideoPickerDemo extends StatefulWidget {
  const VideoPickerDemo({super.key});

  @override
  State<VideoPickerDemo> createState() => _VideoPickerDemoState();
}

class _VideoPickerDemoState extends State<VideoPickerDemo> {
  late VideoPlayerController _videoPlayerController;
  File? file;
  Future<void> selectVideo() async {
    ImagePicker pickVideo = ImagePicker();
    final xFile = await pickVideo.pickVideo(
      source: ImageSource.gallery,
    );
    file = File(xFile!.path);
    setState(() {});
  }

  @override
  void initState() {
    _videoPlayerController = VideoPlayerController.file(file!);
    super.initState();
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Center(
              child: MaterialButton(
                onPressed: () {
                  selectVideo();
                  setState(() {});
                },
                color: Colors.blue,
                child: const Text(
                  'Select Video',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            _videoPlayerController.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _videoPlayerController.value.aspectRatio,
                    child: VideoPlayer(
                      _videoPlayerController,
                    ),
                  )
                : const Text('No video selected'),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _videoPlayerController.value.isPlaying
                ? _videoPlayerController.pause()
                : _videoPlayerController.play();
          });
        },
        child: Icon(
          _videoPlayerController.value.isPlaying
              ? Icons.pause
              : Icons.play_arrow,
        ),
      ),
    );
  }
}
