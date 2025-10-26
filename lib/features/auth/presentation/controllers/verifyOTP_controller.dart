import 'package:get/get.dart';
import 'package:ui_based_ecommerce/app/urls/urls.dart';
import 'package:ui_based_ecommerce/core/models/networl_response.dart';
import 'package:ui_based_ecommerce/core/services/network_caller.dart';
import 'package:ui_based_ecommerce/features/auth/data/models/verifyotp_request_model.dart';
import 'package:ui_based_ecommerce/features/share/data/models/usermodel.dart';

class VerifyOTPController extends GetxController {
  bool _verifyotpInProgress = false;
  String? _errorMessage;
  UserModel? _userModel;
  String? _accessToken;

  // ✅ Public getters
  bool get verifyOtpInProgress => _verifyotpInProgress;
  String? get errorMessage => _errorMessage;
  UserModel? get userModel => _userModel;
  String? get accessToken => _accessToken;

  // ✅ Verify OTP function
  Future<bool> verifyOtp(VerifyOtpMOdel model) async {
    _verifyotpInProgress = true;
    update(); // show loader

    bool isSuccess = false;

    final NetworkResponse response = await Get.find<Networkcaller>()
        .postRequest(url: Urls.verifyOTP, body: model.toJson());

    if (response.isSuccess) {
      _errorMessage = null;
      _userModel = UserModel.fromJson(response.body!['data']['user']);
      _accessToken = response.body!['data']['token'];
      isSuccess = true;
    } else {
      _errorMessage = response.body?['msg'] ?? response.message;
    }

    _verifyotpInProgress = false; // stop loader
    update();

    return isSuccess;
  }
}
