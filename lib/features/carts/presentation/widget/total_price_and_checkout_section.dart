import 'package:flutter/material.dart';
import '../../../../app/constants.dart';
import '../../../../app_color.dart';
class TotalPriceandCheckoutSection extends StatelessWidget {
  const TotalPriceandCheckoutSection({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColor.themeColor.withOpacity(0.1),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(16),
              topLeft: Radius.circular(16)
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text('Total Price',style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600
              ),),
              Text('${tkSign}1000',style: textTheme.titleMedium?.copyWith(
                  color:AppColor.themeColor
              ))
            ],
          ),
          SizedBox(
            width: 120,
            child: FilledButton(
              onPressed: () {},
              child: Text('Checkout'),
            ),
          ),
        ],
      ),
    );
  }
}
