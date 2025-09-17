import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_based_ecommerce/app/extentions/assets_path.dart';

import '../widgets/app_bar_icon_button.dart';
import '../widgets/home_App_Slider.dart';

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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: [
          SizedBox(height: 16),
          _buildSearchbar(),
          SizedBox(height: 16,),
          homeBannerSlider(),
          SizedBox(height: 16,),
          _buildsectionHeader(
            title: 'Categories',
            onTapSeeAll: (){}
          )
        ]
        ),
      ),
    );
  }

  Widget _buildsectionHeader({required String title, required VoidCallback onTapSeeAll }) {
    return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title,style: Theme.of(context).textTheme.titleMedium,),
            TextButton(onPressed: onTapSeeAll, child: Text('See All'))
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


