import 'package:flutter/material.dart';
import 'package:ui_based_ecommerce/features/home/presentation/widgets/product_card.dart';

class WishListProducts extends StatefulWidget {
  const WishListProducts({super.key});

  @override
  State<WishListProducts> createState() => _WishListProductsState();
}

class _WishListProductsState extends State<WishListProducts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: 12,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 8

        ),
        itemBuilder: (context, index) {
          return FittedBox(child: ProductCard());
        },
      ),
    );
  }
}
