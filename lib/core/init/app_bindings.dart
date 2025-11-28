import 'package:get/get.dart';

import '../network/api_client.dart';
import '../../features/Owner/data/domain/field_repository.dart';
import '../../features/Owner/data/repo/field_repo_implementation.dart';
import '../../features/profile/presentation/controllers/user_profie_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApiClient>(() => ApiClient());

    Get.lazyPut<FieldRepo>(
          () => FieldRepositoryImplementation(apiClient: Get.find<ApiClient>()),
    );

    // Get.lazyPut<UserProfileController>(
    //       () => UserProfileController(Get.find<FieldRepo>()),
    // );
  }
}
