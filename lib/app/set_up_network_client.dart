import 'package:flutter/cupertino.dart';
import 'package:ui_based_ecommerce/app/app.dart';
import 'package:ui_based_ecommerce/core/services/network_caller.dart';
import 'package:ui_based_ecommerce/features/auth/presentation/screens/sign_in.dart';

Networkcaller setUpNetworkClient() {
  return Networkcaller(onUnAuthorize: _onUnAuthorize, accessToken: '');
}

Future<void> _onUnAuthorize() async {
  Navigator.pushNamedAndRemoveUntil(
    CraftyBay.navigatorKey.currentContext!,
    SignIn.name,
    (predicate) => false,
  );
}
