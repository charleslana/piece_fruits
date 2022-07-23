import 'package:flutter/material.dart';
import 'package:piece_fruits/src/constants/image_constant.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Image.asset(
        pieceFruitsLogo,
        fit: BoxFit.contain,
      ),
    );
  }
}
