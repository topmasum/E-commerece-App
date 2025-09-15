import 'package:get/get.dart';
import 'package:ui_based_ecommerce/features/share/presentation/controllers/main_nav_controller.dart';

class ControllerBinder extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(MainNavController());
  }

}