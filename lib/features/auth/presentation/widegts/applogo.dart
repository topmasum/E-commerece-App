
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../app/extentions/assets_path.dart';
class App_logo extends StatelessWidget {
  const App_logo({
    super.key,
    this.width
  });
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(AssetPath.logoSvg,width: width?? 120,);
  }
}