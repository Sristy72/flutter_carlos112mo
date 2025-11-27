
import 'package:flutter_carlos112mo/features/message/data/repo/msg_repo_impl.dart';
import 'package:flutter_carlos112mo/features/message/domain/msg_repo.dart';
import 'package:flutter_carlos112mo/features/player/data/repo/field_repo_impl.dart';
import 'package:flutter_carlos112mo/features/player/data/repo/find_field_repo_impl.dart';
import 'package:flutter_carlos112mo/features/player/domain/field_repo.dart';
import 'package:flutter_carlos112mo/features/player/domain/find_field_repo.dart';
import 'package:flutter_carlos112mo/features/team/data/repo/team_repo_impl.dart';
import 'package:flutter_carlos112mo/features/team/domain/team_repo.dart';
import 'package:flutter_carlos112mo/features/profile/data/repositories/user_profile_repository_impl.dart';
import 'package:flutter_carlos112mo/features/profile/domain/repositories/user_profile_repository.dart';
import 'package:flutter_carlos112mo/features/wall/data/repositories/create_post_repository_impl.dart';
import 'package:flutter_carlos112mo/features/wall/data/repositories/wall_repository_impl.dart';
import 'package:flutter_carlos112mo/features/wall/domain/repositories/create_post_repository.dart';
import 'package:flutter_carlos112mo/features/wall/domain/repositories/wall_repository.dart';
import 'package:get/get.dart';

import '../../features/Owner/data/domain/field_repository.dart';
import '../../features/Owner/data/repo/field_repo_implementation.dart';
import '../../features/auth/data/repo/auth_repo_impl.dart';
import '../../features/auth/domain/auth_repo.dart';
import '../../features/player/data/repo/field_repo_impl.dart';
import '../../features/player/data/repo/find_field_repo_impl.dart';
import '../../features/player/domain/field_repo.dart';
import '../../features/player/domain/find_field_repo.dart';
import '../../features/profile/data/repositories/user_profile_repository_impl.dart';
import '../../features/profile/domain/repositories/user_profile_repository.dart';
import '../../features/team/data/repo/team_repo_impl.dart';
import '../../features/team/domain/team_repo.dart';

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

  Get.lazyPut<TeamRepository>(
    () => TeamRepositoryImpl(apiClient: Get.find()),
    fenix: true,
  );
    Get.lazyPut<UserProfileRepository>(
        () => UserProfileRepositoryImpl(apiClient: Get.find()),
      fenix: true
    );
    Get.lazyPut<WallRepository>(
        () => WallRepositoryImpl(apiClient: Get.find()),
      fenix: true
    );
    Get.lazyPut<CreatePostRepository>(
        () => CreatePostRepositoryImpl(apiClient: Get.find()),
      fenix: true
    );
    Get.lazyPut<FieldRepo>(
        () => FieldRepositoryImplementation(apiClient: Get.find()),
      fenix: true
    );
  Get.lazyPut<UserProfileRepository>(
    () => UserProfileRepositoryImpl(apiClient: Get.find()),
    fenix: true,
  );

  Get.lazyPut<ChatRepository>(
    () => ChatRepositoryImpl(apiClient: Get.find()),
    fenix: true,
  );
}
