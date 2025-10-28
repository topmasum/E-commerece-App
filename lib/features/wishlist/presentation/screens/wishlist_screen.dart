import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_based_ecommerce/features/share/presentation/controllers/main_nav_controller.dart';

import '../../../home/presentation/widgets/product_card.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_,__) => _backToHome(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('WishList'),
          leading: BackButton(onPressed: _backToHome),
        ),
        body:GridView.builder(
          itemCount: 12,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8

          ),
          itemBuilder: (context, index) {
           // return FittedBox(child: ProductCard());
          },
        ),
      )
    
    );
  }
  void _backToHome(){
    Get.find<MainNavController>().moveToHome();
  }
}
