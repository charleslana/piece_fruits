import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:piece_fruits/src/controllers/side_bar_controller.dart';
import 'package:piece_fruits/src/interfaces/custom_scroll_abstract.dart';
import 'package:piece_fruits/src/services/account_character_service.dart';

class OverviewController extends GetxController
    with StateMixin<String>
    implements CustomScrollAbstract {
  OverviewController({
    required this.accountCharacterService,
  });

  AccountCharacterService accountCharacterService = AccountCharacterService();
  final ScrollController scrollController = ScrollController();
  RxDouble offset = 0.0.obs;
  final SideBarController sideBarController = Get.find<SideBarController>();

  @override
  void onInit() {
    listenScrollController();
    _fetchDetailsCharacter();
    super.onInit();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  @override
  void goToTop() {
    if (scrollController.hasClients) {
      scrollController.jumpTo(scrollController.position.minScrollExtent);
    }
  }

  @override
  void listenScrollController() {
    scrollController.addListener(() {
      offset.value = scrollController.offset;
    });
  }

  Future<void> _fetchDetailsCharacter() async {
    change(null, status: RxStatus.success());
  }
}
