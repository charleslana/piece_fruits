import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:piece_fruits/src/constants/route_constant.dart';
import 'package:piece_fruits/src/enums/toast_enum.dart';
import 'package:piece_fruits/src/models/account_character_model.dart';
import 'package:piece_fruits/src/models/response_model.dart';
import 'package:piece_fruits/src/services/account_character_service.dart';
import 'package:piece_fruits/src/utils/functions.dart';

class SideBarController extends GetxController
    with StateMixin<AccountCharacterModel> {
  SideBarController({
    required this.accountCharacterService,
  });

  AccountCharacterService accountCharacterService = AccountCharacterService();
  final GlobalKey<ScaffoldState> key = GlobalKey();

  Future<void> fetchDetailsCharacter() async {
    change(null, status: RxStatus.loading());
    await accountCharacterService.getDetailsAccountCharacter().then((result) {
      change(result, status: RxStatus.success());
    }, onError: (dynamic err) {
      change(null, status: RxStatus.error(err.toString()));
    });
  }

  void logoutAccount() {
    logout();
  }

  Future<void> logoutAccountCharacter() async {
    showLoading();
    await accountCharacterService.logoutAccountCharacter().then(
      (result) {
        navigateOffAll(accountCharacterRoute);
      },
      onError: (dynamic error) {
        goBack();
        final ResponseModel responseModel = responseModelFromJson(error);
        showToast(responseModel.message!, ToastEnum.error);
      },
    );
  }
}
