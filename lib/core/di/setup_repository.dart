import 'package:flutter_carlos112mo/features/player/data/repo/field_repo_impl.dart';
import 'package:flutter_carlos112mo/features/player/data/repo/find_field_repo_impl.dart';
import 'package:flutter_carlos112mo/features/player/domain/field_repo.dart';
import 'package:flutter_carlos112mo/features/player/domain/find_field_repo.dart';
import 'package:flutter_carlos112mo/features/profile/data/repositories/user_profile_repository_impl.dart';
import 'package:flutter_carlos112mo/features/profile/domain/repositories/user_profile_repository.dart';
import 'package:get/get.dart';

import '../../features/auth/data/repo/auth_repo_impl.dart';
import '../../features/auth/domain/auth_repo.dart';

void setupRepository() {
  Get.lazyPut<AuthRepository>(
    () => AuthRepositoryImpl(apiClient: Get.find()),
    fenix: true,
  );

  Get.lazyPut<FieldRepository>(
    () => FieldRepositoryImpl(apiClient: Get.find()),
    fenix: true,
  );

    Get.lazyPut<FindFieldRepository>(
    () => FindFieldRepositoryImpl(apiClient: Get.find()),
    fenix: true,
  );

    Get.lazyPut<UserProfileRepository>(
        () => UserProfileRepositoryImpl(apiClient: Get.find()),
      fenix: true
    );
}
