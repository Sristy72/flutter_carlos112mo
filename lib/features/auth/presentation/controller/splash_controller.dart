import 'package:flutter_carlos112mo/features/auth/presentation/controller/auth_controller.dart';
import 'package:flutter_carlos112mo/features/auth/presentation/screens/login_screen.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../../core/network/services/auth_storage_service.dart';
import '../../../Owner/presentation/screens/owner_home_screen.dart';
import '../../../others/presentation/screens/dashboard_screen.dart';

class SplashController extends GetxController {
  late VideoPlayerController videoPlayerController;

  final _authController = Get.find<AuthController>();
  final _authStorage = Get.find<AuthStorageService>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    videoPlayerController =
        VideoPlayerController.asset('assets/videos/splash.mp4')
          ..initialize().then((_) {
            videoPlayerController.play();
            videoPlayerController.setVolume(0);
            update();
          });
          Future.delayed(const Duration(seconds: 4), () async {
      await checkAuth();
    });
  }

          

    Future<void> checkAuth() async {
      final refreshToken = await _authStorage.getRefreshToken();

      // 🚫 No refresh token? → User not logged in
      if (refreshToken == null || refreshToken.isEmpty) {
        Get.offAll(() => LoginScreen());
        return;
      }

      // ✅ Token exists → Try refreshing
      final success = await _authController.refreshToken();

      if (!success) {
        // Refresh failed → go to login
        Get.offAll(() => LoginScreen());
      }
    }

    // videoPlayerController.addListener((){

    //   // if(videoPlayerController.value.position == videoPlayerController.value.duration){
    //   //   Get.off(() => LoginScreen());
    //   // }
    // });
  

  @override
  void onClose() {
    videoPlayerController.dispose();
    super.onClose();
  }
}
