import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_based_ecommerce/features/auth/presentation/utils/app_version.dart';
import '../../../../app/extentions/assets_path.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
 static const String name='/';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Spacer(),
              SvgPicture.asset(AssetPath.logoSvg,width: 120,),
              Spacer(),
              CircularProgressIndicator(),
              const SizedBox( height: 12),
              Text('Version ${AppVersion.currentVersion}'),

            ],
          ),
        ),
      ),
    );
  }
}
