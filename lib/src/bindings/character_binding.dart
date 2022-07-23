import 'package:get/get.dart';
import 'package:piece_fruits/src/controllers/character_controller.dart';
import 'package:piece_fruits/src/services/character_service.dart';

class CharacterBinding implements Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<CharacterService>(CharacterService.new)
      ..lazyPut<CharacterController>(() => CharacterController(
            characterService: Get.find<CharacterService>(),
          ));
  }
}
