import 'package:get/get.dart';
import 'package:piece_fruits/src/controllers/landing_controller.dart';
import 'package:piece_fruits/src/services/landing_service.dart';
import 'package:piece_fruits/src/services/login_service.dart';

class LandingBinding implements Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<LoginService>(LoginService.new)
      ..lazyPut<LandingService>(LandingService.new)
      ..lazyPut<LandingController>(() => LandingController(
            landingService: Get.find<LandingService>(),
            loginService: Get.find<LoginService>(),
          ));
  }
}
