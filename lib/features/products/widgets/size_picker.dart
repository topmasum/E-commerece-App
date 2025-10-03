import 'package:flutter/material.dart';
import 'package:ui_based_ecommerce/app_color.dart';

class SizePicker extends StatefulWidget {
  const SizePicker({super.key, required this.sizes, required this.onChanged});
  final List<String> sizes;
  final Function(String) onChanged;

  @override
  State<SizePicker> createState() => _SizePickerState();
}

class _SizePickerState extends State<SizePicker> {
  String? _selectedSize;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 8, // space between circles
        children: widget.sizes.map((size) {
          final isSelected = _selectedSize == size;
          return GestureDetector(
            onTap: () {
              setState(() {
                _selectedSize = size;
              });
              widget.onChanged(size);
            },
            child: CircleAvatar(
              radius: 18, // size of circle
              backgroundColor: isSelected ? AppColor.themeColor : Colors.transparent,
              foregroundColor: isSelected ? Colors.white : Colors.black,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey),
                ),
                alignment: Alignment.center,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    size,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: isSelected ? Colors.white : Colors.black,
                    ),
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
