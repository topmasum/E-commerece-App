import 'package:get/get.dart';
import 'package:ui_based_ecommerce/app/urls/urls.dart';
import 'package:ui_based_ecommerce/core/services/network_caller.dart';
import '../../../../core/models/networl_response.dart';
import '../../data/models/home_slider.dart';

class HomeSliderController extends GetxController {
  bool _sliderInProgress = false;
  String? _errorMessage;
  List<HomeSliderModel> _slider = [];

  bool get sliderInProgress => _sliderInProgress;
  String? get errorMessage => _errorMessage;
  List<HomeSliderModel> get slider => _slider;

  /// Fetch all sliders from API
  Future<bool> getHomeSliders() async {
    bool isSuccess= false;
    update();

    final NetworkResponse response =
    await Get.find<Networkcaller>().getRequest( url: Urls.sliderUrl);

    if (response.isSuccess) {
      _errorMessage = null;
      List<HomeSliderModel> listModel=[];
      for(Map<String,dynamic> jsonData in response.body?['data']['results'] ?? []){
        listModel.add(HomeSliderModel.fromJson(jsonData));
      }
      _slider=listModel;
      isSuccess = true;
    } else {
      _errorMessage = response.message ;
    }
    _sliderInProgress=false;
    update();

      return isSuccess;

  }
}
