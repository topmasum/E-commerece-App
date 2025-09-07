import 'dart:ui';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:ui_based_ecommerce/app/app.dart';
import 'package:ui_based_ecommerce/features/auth/presentation/utils/app_version.dart';

import 'firebase_options.dart';

//localization
//theme
//analysis
//crashlytics

Future<void> main()
async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //Framework error
  FlutterError.onError=FirebaseCrashlytics.instance.recordFlutterError;
  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };
  await AppVersion.getCurrentVersion();
  runApp(const CraftyBay());
}