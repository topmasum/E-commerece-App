import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_based_ecommerce/features/share/presentation/controllers/category_controller.dart';
import 'package:ui_based_ecommerce/features/share/presentation/controllers/main_nav_controller.dart';
import 'package:ui_based_ecommerce/features/share/presentation/widget/product_category_item.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  final ScrollController _scrollController=ScrollController();
  final CategoryController _categoryController=Get.find<CategoryController>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      _categoryController.fetchCategories();
      _scrollController.addListener(_loadmore);
    });
  }
  void _loadmore(){
    if(_scrollController.position.extentAfter<400){
      _categoryController.fetchCategories();
    }
  }
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_,__) => _backToHome(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Categories'),
          leading: BackButton(onPressed: _backToHome),
        ),
        body: GetBuilder(
          init: _categoryController,
          builder: (_) {
            if(_categoryController.isInitialLoading){
              return SizedBox.expand(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Expanded(
                    child: GridView.builder(
                      controller: _scrollController,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 4,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                      ),
                      itemCount: _categoryController.categoryList.length,
                      itemBuilder: (context, index) {
                        return FittedBox(child: ProductCategoryItem());
                      },
                    ),
                  ),
                  if (_categoryController.getCategoryInProgress)
                    SizedBox(
                      height: 4,
                      child: LinearProgressIndicator(),
                    ),
                ],
              )

            );
          }
        ),
      ),
    );
  }
  void _backToHome(){
    Get.find<MainNavController>().moveToHome();
}
}
