import 'dart:async';

import 'package:get/get.dart';
import 'package:piece_fruits/src/constants/route_constant.dart';
import 'package:piece_fruits/src/utils/functions.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    Timer(
      const Duration(seconds: 2),
      () => navigateOff(overviewRoute),
    );
    super.onInit();
  }
}
