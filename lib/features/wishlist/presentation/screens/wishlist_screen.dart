import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ui_based_ecommerce/features/products/product_list_screen.dart';
import 'package:ui_based_ecommerce/features/share/presentation/controllers/main_nav_controller.dart';

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
        body:ProductListScreen(Categoryname: ''),
      )
    
    );
  }
  void _backToHome(){
    Get.find<MainNavController>().moveToHome();
  }
}
