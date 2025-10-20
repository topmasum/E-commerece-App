import 'package:flutter/material.dart';
class CenteredCirculerProgress extends StatelessWidget {
  const CenteredCirculerProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    )
    ;
  }
}
