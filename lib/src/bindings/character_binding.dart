import 'package:get/get.dart';
import 'package:piece_fruits/src/controllers/create_account_character_controller.dart';
import 'package:piece_fruits/src/services/account_character_service.dart';
import 'package:piece_fruits/src/services/character_service.dart';

class CharacterBinding implements Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<CharacterService>(CharacterService.new)
      ..lazyPut<CreateAccountCharacterController>(
          () => CreateAccountCharacterController(
                characterService: Get.find<CharacterService>(),
                accountCharacterService: Get.find<AccountCharacterService>(),
              ));
  }
}
