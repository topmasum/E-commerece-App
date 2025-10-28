import 'package:get/get.dart';
import '../../../../core/services/network_caller.dart';
import '../../../../core/models/networl_response.dart';
import '../../../../app/urls/urls.dart';
import '../../data/models/product_details_model.dart';

class ProductDetailsController extends GetxController {
  final Networkcaller _networkCaller = Get.find<Networkcaller>();

  bool _isLoading = false;
  ProductDetailsModel? _productDetails;
  String? _errorMessage;

  bool get isLoading => _isLoading;
  ProductDetailsModel? get productDetails => _productDetails;
  String? get errorMessage => _errorMessage;

  /// Fetch product details by product ID
  Future<bool> fetchProductDetails(String productId) async {
    _isLoading = true;
    bool isSuccess=false;
    update();
      final NetworkResponse response =
      await _networkCaller.getRequest(url: Urls.productDetailsUrl(productId));
      if (response.isSuccess) {
        _productDetails = ProductDetailsModel.fromJson(response.body!['data']);
        isSuccess=true;
        _errorMessage=null;
      } else {
        _errorMessage = response.message;
      }
    _isLoading = false;
    update();
    return isSuccess;
  }
}
