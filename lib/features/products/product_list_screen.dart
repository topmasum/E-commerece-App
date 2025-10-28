import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:ui_based_ecommerce/features/home/presentation/widgets/product_card.dart';
import 'package:ui_based_ecommerce/features/products/presentation/controllers/productList_controller.dart';
import 'package:ui_based_ecommerce/features/share/data/models/category_model.dart';

import '../share/presentation/widget/centered_circuler_progress.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key, required this.categoryModel});

  static const String name = '/product-screen';
  final CategoryModel categoryModel;
  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  final ProductListController productListController = ProductListController();
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_loadMore);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      productListController.getProductListbyCategoryID(widget.categoryModel.id);
    });
  }

  void _loadMore() {
    if (_scrollController.position.extentAfter < 400) {
      productListController.getProductListbyCategoryID(widget.categoryModel.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.categoryModel.title)),
      body: GetBuilder(
        init: productListController,
        builder: (controller) {
          if (controller.isInitialLoading) {
            return const CenteredCirculerProgress(); // ✅ your reusable loader
          }
          return Column(
            children: [
              Expanded(
                child: GridView.builder(
                  controller: _scrollController,
                  itemCount: controller.productList.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 8,
                  ),
                  itemBuilder: (context, index) {
                    return FittedBox(child: ProductCard(productModel: controller.productList[index],));
                  },
                ),
              ),
              Visibility(
                visible: controller.getProductListInProgress,
                child: LinearProgressIndicator(),
              ),
            ],
          );
        },
      ),
    );
  }
}
