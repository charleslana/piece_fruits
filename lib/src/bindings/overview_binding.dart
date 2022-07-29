import 'package:get/get.dart';
import 'package:piece_fruits/src/controllers/overview_controller.dart';
import 'package:piece_fruits/src/services/account_character_service.dart';

class OverviewBinding implements Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<AccountCharacterService>(AccountCharacterService.new)
      ..lazyPut<OverviewController>(() => OverviewController(
            accountCharacterService: Get.find<AccountCharacterService>(),
          ));
  }
}
