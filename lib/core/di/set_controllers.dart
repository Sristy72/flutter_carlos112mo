import 'package:flutter_carlos112mo/features/player/presentation/controller/field_controller.dart';
import 'package:flutter_carlos112mo/features/player/presentation/controller/find_field_controller.dart';
import 'package:flutter_carlos112mo/features/profile/presentation/controllers/user_profie_controller.dart';
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

    Get.lazyPut<FindFieldController>(
    () => FindFieldController(Get.find()),
    fenix: true,
  );

    Get.lazyPut<UserProfileController>(
        () => UserProfileController(Get.find()),
      fenix: true
    );



}
