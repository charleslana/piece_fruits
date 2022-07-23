import 'package:flutter/material.dart';
import 'package:piece_fruits/src/constants/image_constant.dart';

class StarterBg extends StatelessWidget {
  const StarterBg({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage(starterBg),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.4),
            BlendMode.srcOver,
          ),
        ),
      ),
    );
  }
}
