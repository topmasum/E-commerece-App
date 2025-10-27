import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ui_based_ecommerce/features/home/data/models/home_slider.dart';

class homeBannerSlider extends StatefulWidget {
  const homeBannerSlider({super.key, required this.sliders});
  final List<HomeSliderModel> sliders;

  @override
  State<homeBannerSlider> createState() => _homeBannerSliderState();
}

class _homeBannerSliderState extends State<homeBannerSlider> {
  final ValueNotifier<int> _currentindex = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 180,
            viewportFraction: 1,
            onPageChanged: (int index, CarouselPageChangedReason reason) {
              _currentindex.value = index;
            },
          ),
          items: widget.sliders.map((sliders) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF07ADAE),
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(image: NetworkImage(sliders.photoUrl),fit: BoxFit.cover)
                  ),
                  alignment: Alignment.center,
                );
              },
            );
          }).toList(),
        ),
        ValueListenableBuilder(
          valueListenable: _currentindex,
          builder: (context, value, child) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for(int i =0 ;i<widget.sliders.length ;i++)
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
        )

      ],
    );
  }
}
