
import 'package:flutter/material.dart';
class AppBarIcon extends StatelessWidget {
  const AppBarIcon({super.key, required this.onTap, required this.iconData});
  final VoidCallback onTap;
  final IconData iconData;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(25),
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: CircleAvatar(
          radius: 18,
          backgroundColor: Colors.grey.shade200,
          child: Icon(iconData, color: Colors.grey,),
        ),
      ),
    );
  }
}