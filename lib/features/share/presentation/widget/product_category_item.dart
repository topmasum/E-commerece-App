import 'package:flutter/material.dart';
import 'package:ui_based_ecommerce/features/products/product_list_screen.dart';
class ProductCategoryItem extends StatelessWidget {
  const ProductCategoryItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductListScreen.name, arguments: 'Electronics');
      },
      child: Column(
        spacing: 6,
        children: [
          Container(
            padding: EdgeInsets.all((16)),
            decoration: BoxDecoration(
                color: Color(0xFF07ADAE).withOpacity(0.15),
                borderRadius: BorderRadius.circular(16)
            )
            ,
            child: Icon(Icons.computer,size: 32,color:Color(0xFF07ADAE) ,),
          ),
          Text('Electronics',style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Color(0xFF07ADAE)
          ),)
        ],
      ),
    );
  }
}
