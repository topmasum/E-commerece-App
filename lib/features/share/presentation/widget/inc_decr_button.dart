import 'package:flutter/material.dart';
import 'package:ui_based_ecommerce/app_color.dart';

class IncDecrButton extends StatefulWidget {
  const IncDecrButton({
    super.key,
    required this.onChanged,
    this.buttonColor, // <-- allow color from outside
  });

  final Function(int) onChanged;
  final Color? buttonColor;

  @override
  State<IncDecrButton> createState() => _IncDecrButtonState();
}

class _IncDecrButtonState extends State<IncDecrButton> {
  int _currentValue = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 2,
      children: [
        buildButton(
          Icons.remove,
              () {
            if (_currentValue > 1) {
              _currentValue--;
              widget.onChanged(_currentValue);
            }
            setState(() {});
          },
          widget.buttonColor ?? AppColor.themeColor.withOpacity(0.4), // pass custom color
        ),
        Text(
          _currentValue.toString(),
          style: Theme.of(context)
              .textTheme
              .bodyLarge
              ?.copyWith(fontWeight: FontWeight.bold),
        ),
        buildButton(
          Icons.add,
              () {
            if (_currentValue >= 1) {
              _currentValue++;
              widget.onChanged(_currentValue);
            }
            setState(() {});
          },
          widget.buttonColor ?? AppColor.themeColor,
        ),
      ],
    );
  }

  Widget buildButton(IconData icon, VoidCallback onTap, Color color) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color, // <-- use passed color
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Icon(icon, color: Colors.white),
        ),
      ),
    );
  }
}
