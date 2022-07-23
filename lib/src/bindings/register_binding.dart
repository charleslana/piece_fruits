import 'package:get/get.dart';
import 'package:piece_fruits/src/controllers/register_controller.dart';

class RegisterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(RegisterController.new);
  }
}
