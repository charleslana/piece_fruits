import 'package:get/get.dart';
import 'package:piece_fruits/src/controllers/register_controller.dart';
import 'package:piece_fruits/src/services/register_service.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<RegisterService>(RegisterService.new)
      ..lazyPut<RegisterController>(() => RegisterController(
            registerService: Get.find<RegisterService>(),
          ));
  }
}
