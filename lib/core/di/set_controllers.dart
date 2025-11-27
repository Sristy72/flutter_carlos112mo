import 'package:flutter_carlos112mo/features/Owner/presentation/controllers/field_controller.dart';
import 'package:flutter_carlos112mo/features/message/presentation/controller/msg_controller.dart';
import 'package:flutter_carlos112mo/features/player/presentation/controller/field_controller.dart';
import 'package:flutter_carlos112mo/features/player/presentation/controller/find_field_controller.dart';
import 'package:flutter_carlos112mo/features/team/presentation/controller/team_controller.dart';
import 'package:flutter_carlos112mo/features/profile/presentation/controllers/user_profie_controller.dart';
import 'package:flutter_carlos112mo/features/wall/presentation/controller/create_post_controller.dart';
import 'package:flutter_carlos112mo/features/wall/presentation/controller/wall_controller.dart';
import 'package:get/get.dart';

import '../../features/Owner/data/domain/field_repository.dart';
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

  Get.lazyPut<TeamController>(() => TeamController(Get.find()), fenix: true);
  
    Get.lazyPut<UserProfileController>(
        () => UserProfileController(Get.find()),
      fenix: true
    );

    Get.lazyPut<CreatePostController>(
        () => CreatePostController(Get.find()),
      fenix: true
    );
    Get.lazyPut<WallController>(
        () => WallController(Get.find()),
      fenix: true
    );


  Get.lazyPut<UserProfileController>(
    () => UserProfileController(Get.find()),
    fenix: true,
  );

  Get.lazyPut<MessageController>(
    () => MessageController(Get.find()),
    fenix: true,
  );
  Get.lazyPut<FieldController>(
    () => FieldController(Get.find()),
    fenix: true,
  );
}
