import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app.dart';
import 'core/di/container.dart';
import 'core/router/router_generator.dart';

void main() async {
  // ensure flutter binding is initialized
  WidgetsFlutterBinding.ensureInitialized();

  // ensure screen size is initialized 
  await ScreenUtil.ensureScreenSize();

  // dependency injection
  await setupLocator();

  runApp(const AdminApp(router: AppRouter()));
}

