import 'package:get/get.dart';
import 'package:ui_based_ecommerce/app/urls/urls.dart';
import 'package:ui_based_ecommerce/core/models/networl_response.dart';
import 'package:ui_based_ecommerce/core/services/network_caller.dart';

import '../../../share/data/models/product_details_model.dart';

class ProductDetailsController extends GetxController{
  bool _getProductDetailsInProgress=false;
  ProductDetailsModel? _productDetailsModel;
  String? _errormessage;

  bool get getProductDetailsInProgress=>_getProductDetailsInProgress ;
  ProductDetailsModel? get productDetails => _productDetailsModel;
  String? get errorMessage=> _errormessage;

  Future<bool> getProductDetails(String productId)async{
    bool isSuccess= false;
    _getProductDetailsInProgress=true;
    update();
    final NetworkResponse response= await Get.find<Networkcaller>().getRequest(url:Urls.productDetailsUrl(productId));
    if(response.isSuccess){
      _productDetailsModel= ProductDetailsModel.fromJson(response.body!['data']);
      isSuccess=true;
      _errormessage=null;

    }else{
      _errormessage=response.message;

    }
    _getProductDetailsInProgress=false;
    update();
    return isSuccess;

  }

}