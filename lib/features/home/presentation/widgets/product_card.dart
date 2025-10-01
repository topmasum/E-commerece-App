import 'package:flutter/material.dart';

import '../../../../app/constants.dart';
import '../../../../app/extentions/assets_path.dart';
class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
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
              child: Image.asset(
                AssetPath.dummyNav,
                height: 80,
                width: 140,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 4,
                children: [
                  Text('Nike Air Jordan AH4k',maxLines: 1, style:
                  TextStyle(
                      overflow: TextOverflow.ellipsis
                  ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${tkSign}1200',style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF07ADAE)
                      ),),
                      Wrap(
                        children: [
                          Icon(Icons.star,size: 18,color: Colors.amber,),
                          Text('4.5')
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
    );
  }
}
