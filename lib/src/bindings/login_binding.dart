import 'package:get/get.dart';
import 'package:piece_fruits/src/controllers/login_controller.dart';
import 'package:piece_fruits/src/services/login_service.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<LoginService>(LoginService.new)
      ..lazyPut<LoginController>(() => LoginController(
            loginService: Get.find<LoginService>(),
          ));
  }
}
