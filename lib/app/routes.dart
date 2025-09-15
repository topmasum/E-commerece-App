import 'package:flutter/material.dart';

import '../features/auth/presentation/screens/signUp.dart';
import '../features/auth/presentation/screens/sign_in.dart';
import '../features/auth/presentation/screens/slapsh_screes.dart';
import '../features/auth/presentation/screens/verify_otp.dart';
import '../features/share/presentation/screen/bottem_navigation_screen.dart';

MaterialPageRoute onGenerateRoute(RouteSettings Setting) {
  late Widget screen;
  if (Setting.name == SplashScreen.name) {
    screen = SplashScreen();
  } else if (Setting.name == SignIn.name) {
    screen = SignIn();
  } else if (Setting.name == SignUp.name) {
    screen = SignUp();
  } else if (Setting.name == VerifyOtp.name) {
    screen = VerifyOtp();
  }else if (Setting.name == BottemNavigationScreen.name) {
    screen = BottemNavigationScreen();
  }
  return MaterialPageRoute(builder: (ctx) => screen);
}
