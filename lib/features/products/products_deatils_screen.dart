import 'package:flutter/material.dart';
import 'package:ui_based_ecommerce/features/products/widgets/color_picker.dart';
import 'package:ui_based_ecommerce/features/products/widgets/product_slider.dart';
import 'package:ui_based_ecommerce/features/products/widgets/size_picker.dart';
import 'package:ui_based_ecommerce/features/products/widgets/total_price_and_cart_section.dart';
import 'package:ui_based_ecommerce/features/share/presentation/widget/inc_decr_button.dart';

class ProductsDeatilsScreen extends StatefulWidget {
  const ProductsDeatilsScreen({super.key});

  static const String name = '/product-details-screen';
  @override
  State<ProductsDeatilsScreen> createState() => _ProductsDeatilsScreenState();
}

class _ProductsDeatilsScreenState extends State<ProductsDeatilsScreen> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(title: Text('Product Details')),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProductSlider(),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      spacing: 8,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          spacing: 8,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Nike A321 - New Edition of Jordan Sports',
                                    style: textTheme.bodyLarge?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Wrap(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            size: 24,
                                            color: Colors.amber,
                                          ),
                                          Text(
                                            '4.5',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                        ],
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text('Review'),
                                      ),
                                      Card(
                                        color: Color(0xFF07ADAE),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            4,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(2),
                                          child: Icon(
                                            Icons.favorite_outline,
                                            size: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 90,
                              child: IncDecrButton(onChanged: (int value) {}),
                            ),
                          ],
                        ),
                        Text('Color', style: TextStyle(fontSize: 18)),
                        ColorPicker(
                          colors: ['Red', 'Green', 'Black'],
                          onChanged: (String color) {},
                        ),
                        const SizedBox(height: 8),
                        Text('Size', style: TextStyle(fontSize: 18)),
                        SizePicker(
                          sizes: ['S', 'M', 'L', 'XL', 'XXL'],
                          onChanged: (String size) {},
                        ),
                        const SizedBox(height: 8),
                        Text('Description', style: TextStyle(fontSize: 18)),
                        Text(
                          'A stylish and comfortable shoe crafted with premium materials, designed for all-day wear. Its lightweight sole provides excellent grip and cushioning, making it perfect for both casual outings and active lifestyles.A stylish and comfortable shoe crafted with premium materials, designed for all-day wear. Its lightweight sole provides excellent grip and cushioning, making it perfect for both casual outings and active lifestyles.A stylish and comfortable shoe crafted with premium materials, designed for all-day wear. Its lightweight sole provides excellent grip and cushioning, making it perfect for both casual outings and active lifestyles',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          TotalPriceAndCartSection(textTheme: textTheme),
        ],
      ),
    );
  }
}
