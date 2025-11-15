import 'package:flutter_carlos112mo/features/player/presentation/controller/field_controller.dart';
import 'package:get/get.dart';

import '../../features/auth/presentation/controller/auth_controller.dart';


void setupController() {
  // Auth Controller
  Get.lazyPut<AuthController>(
    () => AuthController(Get.find(), Get.find()),
    fenix: true,
  );

   Get.lazyPut<FieldPlayerController>(
    () => FieldPlayerController(Get.find()),
    fenix: true,
  );

}
