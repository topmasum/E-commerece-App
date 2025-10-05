import 'package:flutter/material.dart';
import 'package:ui_based_ecommerce/app/constants.dart';
import 'package:ui_based_ecommerce/app/extentions/assets_path.dart';
import 'package:ui_based_ecommerce/app_color.dart';

import '../../../products/widgets/total_price_and_cart_section.dart';
import '../../../share/presentation/widget/inc_decr_button.dart';
import '../widget/total_price_and_checkout_section.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: 5,
              itemBuilder: (context, index) {
                return Card(
                  color: Colors.white,
                  elevation:2,
                  shadowColor: AppColor.themeColor.withOpacity(0.3),
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      Container(
                        margin:EdgeInsets.all(4),
                        child: Image.asset(
                          AssetPath.dummyNav,
                          height: 100,
                          width: 100,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                      child: Column(
                                        spacing: 4,
                                        crossAxisAlignment:CrossAxisAlignment.start,
                                    children: [
                                      Text('Nike 134 Shoe -2025 Edition',style: TextTheme.of(context).titleSmall,),
                                      Text('SIze:M  Color:Red',style: TextTheme.of(context).bodySmall,)
                                    ],
                                  )),
                                  IconButton(onPressed: (){}, icon: Icon(Icons.delete))
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                        Text('${tkSign}100',style: TextTheme.of(context).titleSmall?.copyWith(
                                          color: AppColor.themeColor
                                        ),),
                                        IncDecrButton(onChanged: (int p1) { },)
                                      ]
                                ,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: 8);
              },
            ),
          ),
          TotalPriceandCheckoutSection(),
        ],
      ),
    );
  }
}
