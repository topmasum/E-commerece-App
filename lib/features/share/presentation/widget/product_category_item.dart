import 'package:flutter/material.dart';
import 'package:ui_based_ecommerce/features/products/product_list_screen.dart';
import 'package:ui_based_ecommerce/features/share/data/models/category_model.dart';
class ProductCategoryItem extends StatelessWidget {
  const ProductCategoryItem({
    super.key, required this.categoryModel,
  });
final CategoryModel categoryModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, ProductListScreen.name, arguments: categoryModel);
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
            child: Image.network(categoryModel.icon,height: 32,width: 32,errorBuilder: (_,__,___){
              return Icon(Icons.error_outline,size: 32,);
            },),
          ),
          Text(_getText(categoryModel.title),style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Color(0xFF07ADAE)
          ),)
        ],
      ),
    );
  }
  String _getText(String text){
    if(text.length<12){
      return text;
    }
    return "${text.substring(0,9)}...";
  }
}
