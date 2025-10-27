import 'package:get/get.dart';
import 'package:ui_based_ecommerce/app/controller/auth_controller.dart';
import 'package:ui_based_ecommerce/app/set_up_network_client.dart';
import 'package:ui_based_ecommerce/features/auth/presentation/controllers/login_controller.dart';
import 'package:ui_based_ecommerce/features/auth/presentation/controllers/signup_screen_controller.dart';
import 'package:ui_based_ecommerce/features/auth/presentation/controllers/verifyOTP_controller.dart';
import 'package:ui_based_ecommerce/features/home/presentation/controller/home_slider_controller.dart';
import 'package:ui_based_ecommerce/features/share/presentation/controllers/main_nav_controller.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(AuthController());
    Get.put(MainNavController());
    Get.put(setUpNetworkClient());
    Get.put(SignupScreenController());
    Get.put(VerifyOTPController());
    Get.put(LoginController());
    Get.put(HomeSliderController());

  }

}