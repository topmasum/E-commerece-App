import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ui_based_ecommerce/features/share/presentation/controllers/main_nav_controller.dart';
import 'package:ui_based_ecommerce/features/share/presentation/widget/product_category_item.dart';

class CategoryListScreen extends StatefulWidget {
  const CategoryListScreen({super.key});

  @override
  State<CategoryListScreen> createState() => _CategoryListScreenState();
}

class _CategoryListScreenState extends State<CategoryListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        leading: BackButton(onPressed: () {
          Get.find<MainNavController>().moveToHome();
        }),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8
          ),
          itemCount: 10,
          itemBuilder: (context,index){
            return FittedBox(child: ProductCategoryItem());
          },
        ),
      ),
    );
  }
}
