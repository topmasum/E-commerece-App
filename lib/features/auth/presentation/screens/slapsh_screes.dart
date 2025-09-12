import 'package:flutter/material.dart';
import 'package:ui_based_ecommerce/features/auth/presentation/screens/sign_in.dart';
import 'package:ui_based_ecommerce/features/auth/presentation/utils/app_version.dart';
import '../widegts/applogo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String name = '/';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _moveToNextScreen();
  }

  Future<void> _moveToNextScreen() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacementNamed(context, SignIn.name);
  }

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
              App_logo(),
              Spacer(),
              CircularProgressIndicator(),
              const SizedBox(height: 12),
              Text('Version ${AppVersion.currentVersion}'),
            ],
          ),
        ),
      ),
    );
  }
}
