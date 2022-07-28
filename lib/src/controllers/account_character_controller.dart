import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:piece_fruits/src/enums/toast_enum.dart';
import 'package:piece_fruits/src/interfaces/custom_scroll_abstract.dart';
import 'package:piece_fruits/src/models/account_character_model.dart';
import 'package:piece_fruits/src/models/response_model.dart';
import 'package:piece_fruits/src/services/account_character_service.dart';
import 'package:piece_fruits/src/utils/functions.dart';

class AccountCharacterController extends GetxController
    with StateMixin<List<AccountCharacterModel>>
    implements CustomScrollAbstract {
  AccountCharacterController({
    required this.accountCharacterService,
  });

  AccountCharacterService accountCharacterService = AccountCharacterService();
  final ScrollController scrollController = ScrollController();
  RxDouble offset = 0.0.obs;

  @override
  void onInit() {
    listenScrollController();
    _fetchAllAccountCharacters();
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

  Future<void> _fetchAllAccountCharacters() async {
    change(null, status: RxStatus.loading());
    await accountCharacterService.getAllAccountCharacters().then((result) {
      change(result, status: RxStatus.success());
    }, onError: (dynamic err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  Future<void> delete(int id) async {
    showLoading();
    await accountCharacterService.deleteAccountCharacter(id).then(
      (result) {
        showToast(result.message!, ToastEnum.success);
        _fetchAllAccountCharacters();
        hideLoading();
      },
      onError: (dynamic error) {
        hideLoading();
        final ResponseModel responseModel = responseModelFromJson(error);
        showToast(responseModel.message!, ToastEnum.error);
      },
    );
  }
}
