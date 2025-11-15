import 'package:flutter_carlos112mo/features/auth/presentation/screens/login_screen.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class SplashController extends GetxController{
  late VideoPlayerController videoPlayerController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    videoPlayerController = VideoPlayerController.asset('assets/videos/splash.mp4')
    ..initialize().then((_){
      videoPlayerController.play();
      videoPlayerController.setVolume(0);
      update();
    });

    videoPlayerController.addListener((){
      if(videoPlayerController.value.position == videoPlayerController.value.duration){
        Get.off(() => LoginScreen());
      }
    });
  }

  @override
  void onClose() {
    videoPlayerController.dispose();
    super.onClose();
  }
}