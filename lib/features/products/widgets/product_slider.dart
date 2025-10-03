import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ProductSlider extends StatefulWidget {
  const ProductSlider({super.key});

  @override
  State<ProductSlider> createState() => _ProductSliderState();
}

class _ProductSliderState extends State<ProductSlider> {
  final ValueNotifier<int> _currentindex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 220,
            viewportFraction: 1,
            onPageChanged: (int index, CarouselPageChangedReason reason) {
              _currentindex.value = index;
            },
          ),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                  ),
                  alignment: Alignment.center,
                  child: Text('text $i', style: TextStyle(fontSize: 16.0)),
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          bottom: 8,
          left: 0,
          right: 0,
          child: ValueListenableBuilder(
              valueListenable: _currentindex,
              builder: (context, value, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for(int i =0 ;i<5 ;i++)
                      Container(
                        width: 12,
                        height: 12,
                        margin: EdgeInsets.all(2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color:value==i ?Color(0xFF07ADAE): null,
                            border: Border.all(
                                color: Colors.grey
                            )
                        ),

                      )
                  ],
                );
              }
          ),
        )

      ],
    );
  }
}
