import 'package:flutter/material.dart';
import 'package:ui_based_ecommerce/features/products/product_list_screen.dart';
import 'package:ui_based_ecommerce/features/products/products_deatils_screen.dart';
import 'package:ui_based_ecommerce/features/share/data/models/category_model.dart';

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
    final String email= Setting.arguments as String;
    screen = VerifyOtp(email: email,);
  }else if (Setting.name == BottemNavigationScreen.name) {
    screen = BottemNavigationScreen();
  }else if (Setting.name == ProductListScreen.name) {
    final CategoryModel Categoryname= Setting.arguments as CategoryModel;
    screen = ProductListScreen( categoryModel: Categoryname);
  }else if (Setting.name == ProductsDeatilsScreen.name) {
    final String productId= Setting.arguments as String;
    screen = ProductsDeatilsScreen(
      productId: productId,);
  }
  return MaterialPageRoute(builder: (ctx) => screen);
}
