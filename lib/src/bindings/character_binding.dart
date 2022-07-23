import 'package:get/get.dart';
import 'package:piece_fruits/src/controllers/character_controller.dart';

class CharacterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CharacterController>(CharacterController.new);
  }
}
