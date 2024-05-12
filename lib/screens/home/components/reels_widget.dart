import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:video_player/video_player.dart';

import '../../../constants/app_colors.dart';
import '../../../service/cache.dart';
// import '../config/cache_config.dart';

class VideoPlayerWidget extends StatefulWidget {
  final String reelUrl;

  const VideoPlayerWidget({
    super.key,
    required this.reelUrl,
  });

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget>
    with WidgetsBindingObserver {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    initializeController();
  }

  bool _videoInitialized = false;

  initializeController() async {
    var fileInfo = await kCacheManager.getFileFromCache(widget.reelUrl);
    if (fileInfo == null) {
      await kCacheManager.downloadFile(widget.reelUrl);
      fileInfo = await kCacheManager.getFileFromCache(widget.reelUrl);
    }
    if (mounted) {
      _controller = VideoPlayerController.file(fileInfo!.file)
        ..initialize().then((_) {
          setState(() {
            _controller.setLooping(true); // Set video to loop
            _controller.play();
            _videoInitialized = true;
          });
        });
      _controller.addListener(() {
        if (_controller.value.isPlaying && !_isPlaying) {
          // Video has started playing
          setState(() {
            _isPlaying = true;
          });
        }
      });
    }
  }

  bool _isPlaying = false;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      /// App is in the foreground
      _controller.play();
    } else if (state == AppLifecycleState.inactive) {
      /// App is partially obscured
      _controller.pause();
    } else if (state == AppLifecycleState.paused) {
      /// App is in the background
      _controller.pause();
    } else if (state == AppLifecycleState.detached) {
      /// App is terminated
      _controller.dispose();
    }
  }

  @override
  void dispose() {
    log('disposing a controller');
    if (mounted) {
      _controller.dispose();
    } // Dispose of the controller when done
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      left: false,
      right: false,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              if (_videoInitialized) {
                setState(() {
                  if (_controller.value.isPlaying) {
                    _controller.pause();
                    _isPlaying = false;
                  } else {
                    _controller.play();
                    _isPlaying = true;
                  }
                });
              }
            },
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                !_videoInitialized
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.kPrimaryColor,
                        ),
                      )
                    : VideoPlayer(_controller),
                !_videoInitialized
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.kPrimaryColor,
                        ),
                      )
                    : const SizedBox(),
                if (!_isPlaying)
                  Center(
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration:const  BoxDecoration(
                          shape: BoxShape.circle,
                          border: GradientBoxBorder(
                            gradient: AppColors.kButtonGradient,
                            width: 2,
                          )),
                      child: const Center(
                        child: Icon(
                          Icons.play_arrow,
                          size: 30.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
          // here you can add title, user Info,
          // description, views count etc.
        ],
      ),
    );
  }
}
