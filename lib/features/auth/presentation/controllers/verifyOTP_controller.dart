import 'package:get/get.dart';
import 'package:ui_based_ecommerce/app/urls/urls.dart';
import 'package:ui_based_ecommerce/core/models/networl_response.dart';
import 'package:ui_based_ecommerce/core/services/network_caller.dart';
import 'package:ui_based_ecommerce/features/auth/data/models/verifyotp_request_model.dart';

class VerifyOTPController extends GetxController {
  bool _verifyotpInProgress = false;
  String? _errorMessage;

  String? get errorMessage => _errorMessage;
  bool get verifyotpUpProgress => _verifyotpInProgress;

  Future<bool> verifyOtp(VerifyOtpMOdel model) async {
    _verifyotpInProgress = true;
    update(); // show loader

    bool isSuccess = false;

    final NetworkResponse response = await Get.find<Networkcaller>()
        .postRequest(url: Urls.signUPUrl, body: model.toJson());

    if (response.isSuccess) {
      _errorMessage = null;
      isSuccess = true;
    } else {
      _errorMessage = response.body?['msg'] ?? response.message;
    }

    _verifyotpInProgress = false; // ✅ stop loader
    update();

    return isSuccess;
  }
}
