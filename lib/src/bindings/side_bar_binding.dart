import 'package:get/get.dart';
import 'package:piece_fruits/src/controllers/side_bar_controller.dart';
import 'package:piece_fruits/src/services/account_character_service.dart';

class SideBarBinding implements Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<AccountCharacterService>(AccountCharacterService.new)
      ..lazyPut<SideBarController>(() => SideBarController(
            accountCharacterService: Get.find<AccountCharacterService>(),
          ));
  }
}
