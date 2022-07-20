import 'package:get/get.dart';
import 'package:piece_fruits/src/controllers/language_controller.dart';

class LanguageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LanguageController>(LanguageController.new);
  }
}
