import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:ui_based_ecommerce/app/extentions/assets_path.dart';
import 'package:ui_based_ecommerce/features/home/presentation/controller/home_slider_controller.dart';
import 'package:ui_based_ecommerce/features/share/presentation/controllers/category_controller.dart';
import 'package:ui_based_ecommerce/features/share/presentation/controllers/main_nav_controller.dart';
import 'package:ui_based_ecommerce/features/share/presentation/widget/centered_circuler_progress.dart';

import '../../../share/presentation/widget/product_category_item.dart';
import '../widgets/app_bar_icon_button.dart';
import '../widgets/home_App_Slider.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SvgPicture.asset(AssetPath.logoNav),
        actions: [
          AppBarIcon(onTap: () {}, iconData: Icons.person),
          AppBarIcon(onTap: () {}, iconData: Icons.call),
          AppBarIcon(onTap: () {}, iconData: Icons.notifications_active),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 16),
                _buildSearchbar(),
                const SizedBox(height: 16),
                GetBuilder<HomeSliderController>(
                  builder: (controller) {
                    if(controller.sliderInProgress){
                      return SizedBox(
                        height: 180,
                          child: CircularProgressIndicator());
                    }
                    return homeBannerSlider(sliders: controller.slider,);
                  }
                ),
                const SizedBox(height: 16),
                _buildsectionHeader(
                  title: 'Categories',
                  onTapSeeAll: () {
                    Get.find<MainNavController>().moveToCategory();
                  },
                ),
                _buildCategoriesItem(),
                _buildsectionHeader(title: 'New', onTapSeeAll: () {}),
                _buildNewProductList(),
                _buildsectionHeader(title: 'Popular', onTapSeeAll: () {}),
                _buildPopularProductList(),
                _buildsectionHeader(title: 'Special', onTapSeeAll: () {}),
                _buildSpacialProductList(),

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNewProductList(){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
       // children: [1,2,3,59].map((e)=> ProductCard()).toList()
      ),
    );
  }
  Widget _buildPopularProductList(){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
         // children: [1,2,3,59].map((e)=> ProductCard()).toList()
      ),
    );
  }
  Widget _buildSpacialProductList(){
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
         // children: [1,2,3,59].map((e)=> ProductCard()).toList()
      ),
    );
  }

  Widget _buildCategoriesItem() {
    return SizedBox(
      height: 120,
      child: GetBuilder<CategoryController>(
        builder: (controller) {
          if(controller.isInitialLoading){
            return const CenteredCirculerProgress();
          }
          return ListView.separated(
            itemCount: controller.categoryList.length>10 ? 10: controller.categoryList.length,
            primary: false,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return ProductCategoryItem(categoryModel: controller.categoryList[index],);
            },
            separatorBuilder: (context, index) {
              return SizedBox(width: 10);
            },
          );
        }
      ),
    );
  }

  Widget _buildsectionHeader({
    required String title,
    required VoidCallback onTapSeeAll,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleMedium),
        TextButton(onPressed: onTapSeeAll, child: Text('See All')),
      ],
    );
  }

  Widget _buildSearchbar() {
    return TextField(
      onSubmitted: (String? text) {},
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        hintText: 'Search',
        fillColor: Colors.grey.shade100,
        filled: true,
        enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
        prefixIcon: Icon(Icons.search),
      ),
    );
  }
}

