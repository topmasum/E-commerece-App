import 'package:flutter/material.dart';
import 'package:ui_based_ecommerce/app_color.dart';
class ColorPicker extends StatefulWidget {
  const ColorPicker({super.key, required this.colors, required this.onChanged});
  final List<String> colors;
  final Function(String) onChanged;

  @override
  State<ColorPicker> createState() => _ColorPickerState();
}

class _ColorPickerState extends State<ColorPicker> {
  String? _selectedColor;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children:
        widget.colors.map((color){
          return GestureDetector(
            onTap: (){
              _selectedColor=color;
              widget.onChanged(color);
              setState(() {
              });
            },
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: _selectedColor==color ? AppColor.themeColor: null,
                border: Border.all(
                  color: Colors.grey
                ),
                borderRadius: BorderRadius.circular(8)
              ),
              child: Text(color,style:
                TextStyle(
                  color: _selectedColor==color ? Colors.white: null,
                  fontWeight: FontWeight.bold
                ),),
                    ),
          );
        }).toList(),
    );
  }
}
