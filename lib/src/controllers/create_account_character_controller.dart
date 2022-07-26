import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:piece_fruits/src/constants/data_constant.dart';
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
  final GlobalKey<FormState> createAccountCharacterFormKey =
      GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  RxnString faction = RxnString();
  RxnInt characterId = RxnInt();
  RxnString characterName = RxnString();
  RxString name = ''.obs;

  @override
  void onInit() {
    faction.value = factions.first;
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
      characterId.value = result.first.id;
      characterName.value = result.first.name;
      change(result, status: RxStatus.success());
    }, onError: (dynamic err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  String? validator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'validation.field.empty'.tr;
    }
    if (!isName(value.trim())) {
      return 'validation.field.name'.tr;
    }
    name.value = value;
    return null;
  }
}
