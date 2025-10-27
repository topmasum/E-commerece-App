import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:ui_based_ecommerce/features/carts/presentation/screens/cart.dart';
import 'package:ui_based_ecommerce/features/category/presentation/screens/category_list_screen.dart';
import 'package:ui_based_ecommerce/features/home/presentation/controller/home_slider_controller.dart';
import 'package:ui_based_ecommerce/features/home/presentation/screens/home_screen.dart';
import 'package:ui_based_ecommerce/features/share/presentation/controllers/main_nav_controller.dart';
import 'package:ui_based_ecommerce/features/wishlist/presentation/screens/wishlist_screen.dart';

class BottemNavigationScreen extends StatefulWidget {
  static const String name = '/bottom-navbar';
  const BottemNavigationScreen({super.key});

  @override
  State<BottemNavigationScreen> createState() => _BottemNavigationScreenState();
}

class _BottemNavigationScreenState extends State<BottemNavigationScreen> {
  final List<Widget> _screens = [
    HomeScreen(),
    CategoryListScreen(),
    CartScreen(),
    WishListScreen(),
  ];
  @override
  void initState() {
    // TODO: implement initState
    Get.find<HomeSliderController>().getHomeSliders();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainNavController>(
      builder: (mainNavController) {
        return Scaffold(
          body: _screens[mainNavController.currentIndex],
          bottomNavigationBar: NavigationBar(
            selectedIndex: mainNavController.currentIndex,
            onDestinationSelected: mainNavController.changedIndex,
            destinations: [
              NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
              NavigationDestination(
                icon: Icon(Icons.dashboard_customize_outlined),
                label: 'Categories',
              ),
              NavigationDestination(
                icon: Icon(Icons.shopping_cart_checkout),
                label: 'Cart',
              ),
              NavigationDestination(
                icon: Icon(Icons.favorite_outline),
                label: 'WishList',
              ),
            ],
          ),
        );
      },
    );
  }
}
