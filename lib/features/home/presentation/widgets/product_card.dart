import 'package:flutter/material.dart';
import 'package:ui_based_ecommerce/features/products/data/models/product_model.dart';
import 'package:ui_based_ecommerce/features/products/products_deatils_screen.dart';

import '../../../../app/constants.dart';
import '../../../../app/extentions/assets_path.dart';
class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key, required this.productModel,
  });
final ProductModel productModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductsDeatilsScreen.name,arguments: productModel.id);
      },
      child: Card(
        shadowColor:Color(0xFF07ADAE).withOpacity(0.2) ,
        color: Colors.white,
        child: SizedBox(
          width: 140,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Color(0xFF07ADAE).withOpacity(0.1),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8)
                    )
                ),
                child: Image.network(
                  productModel.photos.firstOrNull ?? '',
                  height: 80,
                  width: 140,
                  errorBuilder: (_,__,___){
                    return SizedBox(
                      height: 80,
                        width: 140,
                        child: Icon(Icons.error_outline,size: 48,));
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 4,
                  children: [
                    Text(productModel.title,maxLines: 1, style:
                    TextStyle(
                        overflow: TextOverflow.ellipsis
                    ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('${tkSign}${productModel.currentPrice}',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF07ADAE)
                        ),),
                        Wrap(
                          children: [
                            Icon(Icons.star,size: 18,color: Colors.amber,),
                            Text(productModel.rating.toString())
                          ],
                        ),
                        Card(
                          color:Color(0xFF07ADAE) ,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4)
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2),
                            child: Icon(Icons.favorite_outline,size: 14,color: Colors.white,),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
