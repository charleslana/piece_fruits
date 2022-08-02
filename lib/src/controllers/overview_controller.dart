import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:piece_fruits/src/controllers/side_bar_controller.dart';
import 'package:piece_fruits/src/enums/toast_enum.dart';
import 'package:piece_fruits/src/interfaces/custom_scroll_abstract.dart';
import 'package:piece_fruits/src/models/account_character_model.dart';
import 'package:piece_fruits/src/models/response_model.dart';
import 'package:piece_fruits/src/models/update_account_character_model.dart';
import 'package:piece_fruits/src/services/account_character_service.dart';
import 'package:piece_fruits/src/utils/functions.dart';

class OverviewController extends GetxController
    with StateMixin<AccountCharacterModel>
    implements CustomScrollAbstract {
  OverviewController({
    required this.accountCharacterService,
  });

  AccountCharacterService accountCharacterService = AccountCharacterService();
  final ScrollController scrollController = ScrollController();
  RxDouble offset = 0.0.obs;
  final SideBarController sideBarController = Get.find<SideBarController>();
  final GlobalKey<FormState> overViewFormKey = GlobalKey<FormState>();
  final TextEditingController biographyController = TextEditingController();

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
    change(null, status: RxStatus.loading());
    await accountCharacterService.getDetailsAccountCharacter().then((result) {
      change(result, status: RxStatus.success());
      biographyController.text = result.biography ?? '';
    }, onError: (dynamic err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  void updateBiography() {
    closeKeyboard();
    if (overViewFormKey.currentState!.validate()) {
      showLoading();
      final UpdateAccountCharacterModel updateAccountCharacterModel =
          UpdateAccountCharacterModel(
        biography: biographyController.text.trim(),
      );
      validateUpdateBiography(updateAccountCharacterModel);
    }
  }

  Future<void> validateUpdateBiography(
      UpdateAccountCharacterModel updateAccountCharacter) async {
    await accountCharacterService
        .updateAccountCharacter(updateAccountCharacter)
        .then(
      (result) {
        goBack();
        goBack();
        showToast(result.message!, ToastEnum.success);
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
    if (value.trim().length < 10 || value.trim().length > 200) {
      return 'overview.validation.field.biography.length'.tr;
    }
    return null;
  }
}
