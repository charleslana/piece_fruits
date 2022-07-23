import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:piece_fruits/src/interfaces/custom_app_bar_abstract.dart';

class CharacterController extends GetxController
    with StateMixin<String>
    implements CustomAppBarAbstract {
  final ScrollController scrollController = ScrollController();
  RxDouble offset = 0.0.obs;

  @override
  void onInit() {
    listenScrollController();
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
}
