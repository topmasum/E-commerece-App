import 'package:get/get.dart';
import 'package:ui_based_ecommerce/app/urls/urls.dart';
import 'package:ui_based_ecommerce/core/models/networl_response.dart';
import 'package:ui_based_ecommerce/core/services/network_caller.dart';
import '../../data/models/category_model.dart';

class CategoryController extends GetxController {
  bool _getCategoryInProgress = false;
  bool _isInitialLoading = false;
  int _currentPage = 1; // start from 1
  final int _pageSize = 40;
  int? _lastPageNum;

  List<CategoryModel> _categoryList = [];
  String? _errorMessage;

  bool get getCategoryInProgress => _getCategoryInProgress;
  bool get isInitialLoading => _isInitialLoading;
  List<CategoryModel> get categoryList => _categoryList;
  String? get errorMessage => _errorMessage;

  /// Fetch categories from API with pagination
  Future<bool> fetchCategories() async {
    // Stop if we already reached the last page
    if (_lastPageNum != null && _currentPage > _lastPageNum!) {
      return false;
    }

    // Set loading states
    if (_currentPage == 1) {
      _categoryList.clear();
      _isInitialLoading = true;
    } else {
      _getCategoryInProgress = true;
    }
    update();

    // Make API request
    final NetworkResponse response = await Get.find<Networkcaller>()
        .getRequest(url: Urls.categorylistUrl(_currentPage, _pageSize));

    bool isSuccess = false;

    if (response.isSuccess) {
      _lastPageNum = response.body!['data']['last_page'];
      List<CategoryModel> newCategories = [];

      for (Map<String, dynamic> jsonData in response.body!['data']['results']) {
        newCategories.add(CategoryModel.fromJson(jsonData));
      }

      // Append new items instead of replacing the list
      _categoryList.addAll(newCategories);
      isSuccess = true;
      _errorMessage = null;
      _currentPage++; // increment page for next fetch
    } else {
      _errorMessage = response.message;
    }

    // Reset loading states
    _isInitialLoading = false;
    _getCategoryInProgress = false;
    update();

    return isSuccess;
  }
}
