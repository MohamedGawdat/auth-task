import 'package:get/get.dart';
import '../core/network/interfaces/i_auth_service.dart';
import '../modules/auth/data/datasources/auth_data_source.dart';
import '../modules/auth/data/repositories/auth_repository_impl.dart';
import '../modules/auth/domain/repositories/auth_repository.dart';
import '../modules/auth/domain/use_cases/login_user.dart';
import '../modules/auth/domain/use_cases/register_user.dart';
import '../modules/auth/presentation/controllers/login_controller.dart';
import '../modules/auth/presentation/controllers/register_controller.dart';
import '../core/network/services/firebase_auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../modules/auth/presentation/controllers/user_controller.dart';
import '../modules/share_profile/data/repository/share_profile.dart';
import '../modules/share_profile/domain/entity/user_entity.dart';
import '../modules/share_profile/domain/repository/share_plus.dart';
import '../modules/share_profile/presentation/controller/share_controller.dart';

void setupDependencies() {
  Get.lazyPut<IAuthService>(() => FirebaseAuthService(FirebaseAuth.instance));

  Get.lazyPut<AuthDataSource>(() => AuthDataSource(Get.find<IAuthService>()));

  Get.lazyPut<AuthRepository>(() => AuthRepositoryImpl(Get.find<AuthDataSource>()));

  Get.lazyPut<LoginUser>(() => LoginUser(Get.find<AuthRepository>()));
  Get.lazyPut<RegisterUser>(() => RegisterUser(Get.find<AuthRepository>()));

  Get.lazyPut(() => LoginController(Get.find<LoginUser>()));
  Get.lazyPut(() => RegisterController(Get.find<RegisterUser>()));

  Get.lazyPut(() => UserController());

  Get.lazyPut<ShareProfileRepository>(() => ShareProfileRepositoryImpl());
  Get.lazyPut<ShareProfile>(() => ShareProfile(Get.find()));
  Get.lazyPut<ShareProfileController>(() => ShareProfileController(Get.find()));
}
