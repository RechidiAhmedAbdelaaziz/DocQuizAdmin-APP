import 'package:admin_app/core/helpers/cache.helper.dart';
import 'package:admin_app/core/helpers/dio.helper.dart';
import 'package:admin_app/core/helpers/picker.helper.dart';
import 'package:admin_app/core/services/cloudstorage/cloud_storage.service.dart';
import 'package:admin_app/core/services/cloudstorage/cloudinary.service.dart';
import 'package:admin_app/core/services/filepicker/filepick.service.dart';
import 'package:admin_app/feature/auth/helpers/auth.dependency.dart';
import 'package:admin_app/feature/course/helper/course.dependency.dart';
import 'package:admin_app/feature/domain/helper/domain.dependency.dart';
import 'package:admin_app/feature/exam/helper/exam.dependency.dart';
import 'package:admin_app/feature/level/helper/level.dependency.dart';
import 'package:admin_app/feature/major/helper/major.dependency.dart';
import 'package:admin_app/feature/question/helper/question.dependency.dart';
import 'package:admin_app/feature/source/helper/source.dependency.dart';
import 'package:admin_app/feature/subscription/config/subscription_di.dart';
import 'package:admin_app/feature/subscriptionoffers/helper/subscription_offer_dependency.dart';
import 'package:admin_app/feature/subscriptionrequest/config/subscription_request_di.dart';
import 'package:admin_app/feature/updates/helper/updates.di.dart';
import 'package:admin_app/feature/user/helper/user.di.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../feature/home/helper/home.dependency.dart';

final locator = GetIt.instance;

Future<void> setupLocator() async {
  final sharedPref = await SharedPreferences.getInstance();

  locator.registerLazySingleton<SharedPreferences>(() => sharedPref);

  locator.registerLazySingleton(() => const FlutterSecureStorage());

  locator.registerLazySingleton(() => DioHelper.getDio());
  locator.registerLazySingleton(() => CacheHelper());
  locator.registerLazySingleton(() => ImagePickerHelper());

  //File Picker
  locator.registerLazySingleton<ImagePickerService>(
    () => kIsWeb ? WebFilePicker() : MobileFilePicker(),
  );

  //Cloud storage service
  locator.registerLazySingleton<ImageCloudStorageService>(
    () => CloudinaryService(),
  );

  await setupAuthDependency(locator);
  await setupExamDependency(locator);
  await setupQuestionDependency(locator);
  await setupHomeDependency(locator);
  await setupDomainDependency();
  await setupLevelDependency();
  await setupMajorDependency();
  await setupCourseDependency();
  await setupSourceDependency();
  await setupUpdatesDi(locator);
  await setupUserDi(locator);
  await setupSubscriptionOfferDependency();
  await setupSubscriptionRequestDependency();
  await setupSubscriptionDependency();
}
