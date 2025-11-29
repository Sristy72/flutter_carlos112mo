import 'package:flutter/material.dart';
import 'package:flutter_carlos112mo/features/auth/presentation/controller/splash_controller.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
        builder: (controller){
        final VideoPlayerController videoPlayerController = controller.videoPlayerController;
        return Scaffold(
          body: videoPlayerController.value.isInitialized ?
          SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                width: videoPlayerController.value.size.width,
                height: videoPlayerController.value.size.height,
                child: VideoPlayer(videoPlayerController),
              ),
            ),
          ) : const Center(
            child: CircularProgressIndicator(),
          )
        );

    });
  }
}
