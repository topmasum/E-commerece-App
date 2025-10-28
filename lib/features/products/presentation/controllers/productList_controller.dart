import 'package:get/get.dart';
import 'package:ui_based_ecommerce/features/products/data/models/product_model.dart';

import '../../../../app/urls/urls.dart';
import '../../../../core/models/networl_response.dart';
import '../../../../core/services/network_caller.dart';

class ProductListController extends GetxController{
  //bool _getProductInProgress= false;
  bool _getProductListInProgress = false;
  bool _isInitialLoading = false;
  int _currentPage = 1; // start from 1
  final int _pageSize = 40;
  int? _lastPageNum;

  List<ProductModel> _productList = [];
  String? _errorMessage;

  bool get getProductListInProgress => _getProductListInProgress;
  bool get isInitialLoading => _isInitialLoading;
  List<ProductModel> get productList => _productList;
  String? get errorMessage => _errorMessage;

  /// Fetch categories from API with pagination
  Future<bool> getProductListbyCategoryID(String categoryID) async {
    // Stop if we already reached the last page
    if (_lastPageNum != null && _currentPage > _lastPageNum!) {
      return false;
    }

    // Set loading states
    if (_currentPage == 1) {
      _productList.clear();
      _isInitialLoading = true;
    } else {
      _getProductListInProgress = true;
    }
    update();

    // Make API request
    final NetworkResponse response = await Get.find<Networkcaller>()
        .getRequest(url: Urls.ProductlistUrl(_currentPage, _pageSize, categoryID));

    bool isSuccess = false;

    if (response.isSuccess) {
      _lastPageNum = response.body!['data']['last_page'];
      List<ProductModel> newCategories = [];

      for (Map<String, dynamic> jsonData in response.body!['data']['results']) {
        newCategories.add(ProductModel.fromJson(jsonData));
      }

      // Append new items instead of replacing the list
      _productList.addAll(newCategories);
      isSuccess = true;
      _errorMessage = null;
      _currentPage++; // increment page for next fetch
    } else {
      _errorMessage = response.message;
    }

    // Reset loading states
    _isInitialLoading = false;
    _getProductListInProgress = false;
    update();

    return isSuccess;
  }
  Future<void> refreshCategoryList(String categoryID) async{
    _currentPage=0;
    getProductListbyCategoryID(categoryID);
  }

}