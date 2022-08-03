import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:piece_fruits/src/constants/data_constant.dart';
import 'package:piece_fruits/src/constants/route_constant.dart';
import 'package:piece_fruits/src/enums/toast_enum.dart';
import 'package:piece_fruits/src/interfaces/custom_scroll_abstract.dart';
import 'package:piece_fruits/src/interfaces/form_validator.dart';
import 'package:piece_fruits/src/models/character_model.dart';
import 'package:piece_fruits/src/models/create_account_character_model.dart';
import 'package:piece_fruits/src/models/response_model.dart';
import 'package:piece_fruits/src/services/account_character_service.dart';
import 'package:piece_fruits/src/services/character_service.dart';
import 'package:piece_fruits/src/utils/functions.dart';

class CreateAccountCharacterController extends GetxController
    with StateMixin<List<CharacterModel>>, FormValidator
    implements CustomScrollAbstract {
  CreateAccountCharacterController({
    required this.characterService,
    required this.accountCharacterService,
  });

  CharacterService characterService = CharacterService();
  AccountCharacterService accountCharacterService = AccountCharacterService();
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

  @override
  void scrollTo(double position) {
    // TODO: implement scrollTo
  }

  Future<void> _fetchAllCharacters() async {
    change(null, status: RxStatus.loading());
    await characterService.getAllCharacters().then((result) {
      characterId.value = result.first.id;
      characterName.value = result.first.name;
      change(result, status: RxStatus.success());
    }, onError: (dynamic err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  void create() {
    if (createAccountCharacterFormKey.currentState!.validate()) {
      showLoading();
      final CreateAccountCharacterModel createAccountCharacterModel =
          CreateAccountCharacterModel(
        characterId: characterId.value!,
        name: name.value,
        faction: faction.value!,
      );
      validateCreate(createAccountCharacterModel);
    }
  }

  Future<void> validateCreate(
      CreateAccountCharacterModel createAccountCharacter) async {
    await accountCharacterService
        .createAccountCharacter(createAccountCharacter)
        .then(
      (result) {
        showToast(result.message!, ToastEnum.success);
        navigateOffAll(accountCharacterRoute);
      },
      onError: (dynamic error) {
        goBack();
        final ResponseModel responseModel = responseModelFromJson(error);
        showToast(responseModel.message!, ToastEnum.error);
      },
    );
  }

  String? validator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'validation.field.empty'.tr;
    }
    if (value.trim().length < 3 || value.trim().length > 20) {
      return 'validation.field.name.length'.tr;
    }
    if (!isName(value.trim())) {
      return 'validation.field.name'.tr;
    }
    name.value = value.trim();
    return null;
  }
}
