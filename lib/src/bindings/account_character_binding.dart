import 'package:get/get.dart';
import 'package:piece_fruits/src/controllers/account_character_controller.dart';
import 'package:piece_fruits/src/services/account_character_service.dart';

class AccountCharacterBinding implements Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<AccountCharacterService>(AccountCharacterService.new)
      ..lazyPut<AccountCharacterController>(() => AccountCharacterController(
            accountCharacterService: Get.find<AccountCharacterService>(),
          ));
  }
}
