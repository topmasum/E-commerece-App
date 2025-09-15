import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:ui_based_ecommerce/app/controller/language_controller.dart';
import 'package:ui_based_ecommerce/app/controller_binders.dart';
import 'package:ui_based_ecommerce/app/routes.dart';
import 'package:ui_based_ecommerce/app_theme.dart';
import 'package:ui_based_ecommerce/features/auth/presentation/screens/slapsh_screes.dart';
import 'package:ui_based_ecommerce/l10n/app_localizations.dart';

class CraftyBay extends StatefulWidget {
  const CraftyBay({super.key});
  static final LanguageController languageController = LanguageController();
  @override
  State<CraftyBay> createState() => _CraftyBayState();
}

class _CraftyBayState extends State<CraftyBay> {
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(
    analytics: analytics,
  );

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: CraftyBay.languageController,

      builder: (languageController) {
        return GetMaterialApp(
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: languageController.currentLocal,
          supportedLocales: languageController.supportedLocals,
          theme: AppTheme.LightThemeData,
          darkTheme: AppTheme.DarkThemeData,
          themeMode: ThemeMode.light,
          home: SplashScreen(),
          navigatorObservers: [observer],
          initialRoute: SplashScreen.name,
          onGenerateRoute: onGenerateRoute,
          initialBinding: ControllerBinder(),
        );
      },
    );
  }
}
