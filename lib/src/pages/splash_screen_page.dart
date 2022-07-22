import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:piece_fruits/src/constants/image_constant.dart';
import 'package:piece_fruits/src/controllers/splash_screen_controller.dart';

class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.find<SplashScreenController>();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: SizedBox(
              height: 200,
              child: Image.asset(
                charlesLogo,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
