import 'package:get/get.dart';
import 'package:ui_based_ecommerce/app/urls/urls.dart';
import 'package:ui_based_ecommerce/core/models/networl_response.dart';
import 'package:ui_based_ecommerce/core/services/network_caller.dart';
import 'package:ui_based_ecommerce/features/auth/data/models/signup_request.dart';

class SignupScreenController extends GetxController {
  bool _signUpInProgress = false;
  String? _errorMessage;

  String? get errorMessage => _errorMessage;
  bool get signUpProgress => _signUpInProgress;

  Future<bool> signUp(SignupRequestModel model) async {
    _signUpInProgress = true;
    update(); // show loader

    bool isSuccess = false;

    final NetworkResponse response = await Get.find<Networkcaller>()
        .postRequest(url: Urls.signUPUrl, body: model.toJason());

    if (response.isSuccess) {
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.body?['msg'] ?? response.message;
    }

    _signUpInProgress = false; // ✅ stop loader
    update();

    return isSuccess;
  }
}
