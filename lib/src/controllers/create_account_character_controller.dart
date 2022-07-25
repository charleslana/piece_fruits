import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:piece_fruits/src/interfaces/custom_scroll_abstract.dart';
import 'package:piece_fruits/src/interfaces/form_validator.dart';
import 'package:piece_fruits/src/models/character_model.dart';
import 'package:piece_fruits/src/services/character_service.dart';

class CreateAccountCharacterController extends GetxController
    with StateMixin<List<CharacterModel>>, FormValidator
    implements CustomScrollAbstract {
  CreateAccountCharacterController({
    required this.characterService,
  });

  CharacterService characterService = CharacterService();
  final ScrollController scrollController = ScrollController();
  RxDouble offset = 0.0.obs;
  RxInt currentStep = 0.obs;

  @override
  void onInit() {
    listenScrollController();
    _fetchAllCharacters();
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

  Future<void> _fetchAllCharacters() async {
    await characterService.getAllCharacters().then((result) {
      change(result, status: RxStatus.success());
    }, onError: (dynamic err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }
}