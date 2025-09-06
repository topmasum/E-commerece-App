import 'package:flutter/material.dart';
import 'package:ui_based_ecommerce/app/extentions/localization_extension.dart';
import 'package:ui_based_ecommerce/features/share/presentation/widget/language_change_switch.dart';
//import 'package:ui_based_ecommerce/l10n/app_localizations.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
               Text(context.localization.hello),
            LanguageChangeSwitch(),
          ],
        ),
      ),
    );
  }
}
