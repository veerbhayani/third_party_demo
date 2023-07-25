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
  late VideoPlayerController _controller;
  bool isVideoSelected = false;
  bool isPlaying = false;
  bool isMuted = false;
  File? file;
  Future<void> selectVideo() async {
    ImagePicker pickVideo = ImagePicker();
    final xFile = await pickVideo.pickVideo(
      source: ImageSource.gallery,
    );
    if (xFile != null) {
      file = File(xFile.path);
      _controller = VideoPlayerController.file(file!)
        ..initialize().then((_) {
          setState(() {});
          _controller.play();
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Video Player Demo',
        ),
        actions: [
          TextButton(
            onPressed: () async {
              await selectVideo();
              if (file != null) {
                isVideoSelected = true;
              } else {
                isVideoSelected = false;
              }
              setState(() {});
            },
            child: const Text(
              'Select Video',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          if (file != null && isVideoSelected == true)
            _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(
                      _controller,
                    ),
                  )
                : Container()
          else
            const Padding(
              padding: EdgeInsets.all(
                15,
              ),
              child: Center(
                child: Text(
                  'No Video Selected',
                ),
              ),
            ),
          isVideoSelected
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    isPlaying
                        ? IconButton(
                            onPressed: () async {
                              isPlaying = false;
                              await _controller.play();
                              setState(() {});
                            },
                            icon: const Icon(
                              Icons.play_arrow_rounded,
                            ),
                          )
                        : IconButton(
                            onPressed: () async {
                              await _controller.pause();
                              isPlaying = true;
                              setState(() {});
                            },
                            icon: const Icon(
                              Icons.pause,
                            ),
                          ),
                    IconButton(
                      onPressed: () {
                        _controller.dispose();
                        isVideoSelected = false;
                        setState(() {});
                      },
                      icon: const Icon(
                        Icons.stop,
                      ),
                    ),
                    isMuted
                        ? IconButton(
                            onPressed: () {
                              _controller.setVolume(
                                200,
                              );
                              isMuted = !isMuted;
                              setState(() {});
                            },
                            icon: const Icon(
                              Icons.volume_off,
                            ),
                          )
                        : IconButton(
                            onPressed: () {
                              _controller.setVolume(
                                0,
                              );
                              isMuted = !isMuted;
                              setState(() {});
                            },
                            icon: const Icon(
                              Icons.volume_up,
                            ),
                          ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
