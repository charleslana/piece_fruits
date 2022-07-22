import 'package:get/get.dart';
import 'package:piece_fruits/src/controllers/splash_screen_controller.dart';

class SplashScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashScreenController>(SplashScreenController.new);
  }
}
