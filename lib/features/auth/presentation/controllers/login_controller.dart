import 'package:get/get.dart';
import 'package:ui_based_ecommerce/app/urls/urls.dart';
import 'package:ui_based_ecommerce/core/models/networl_response.dart';
import 'package:ui_based_ecommerce/core/services/network_caller.dart';
import 'package:ui_based_ecommerce/features/auth/data/models/login_request_model.dart';

import '../../../share/data/models/usermodel.dart';

class LoginController extends GetxController {
  bool _loginpInProgress = false;
  String? _errorMessage;

  String? get errorMessage => _errorMessage;
  bool get loginProgress => _loginpInProgress;

  UserModel? _userModel;
  String? _accessToken;
  UserModel? get userModel => _userModel;
  String? get accessToken => _accessToken;

  Future<bool> logIn(LoginRequestModel model) async {
    _loginpInProgress = true;
    update(); // show loader

    bool isSuccess = false;

    final NetworkResponse response = await Get.find<Networkcaller>()
        .postRequest(url: Urls.loginUrl, body: model.toJson());

    if (response.isSuccess) {
      _errorMessage = null;
      _userModel = UserModel.fromJson(response.body!['data']['user']);
      _accessToken = response.body!['data']['token'];
      isSuccess = true;
    } else {
      _errorMessage = response.body?['msg'] ?? response.message;
    }

    _loginpInProgress = false; // ✅ stop loader
    update();

    return isSuccess;
  }
}
