import 'package:flutter/material.dart';
class ProductCategoryItem extends StatelessWidget {
  const ProductCategoryItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
