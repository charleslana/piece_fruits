import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:piece_fruits/src/constants/route_constant.dart';
import 'package:piece_fruits/src/enums/toast_enum.dart';
import 'package:piece_fruits/src/models/response_model.dart';
import 'package:piece_fruits/src/services/account_character_service.dart';
import 'package:piece_fruits/src/utils/functions.dart';

class SideBarController extends GetxController {
  SideBarController({
    required this.accountCharacterService,
  });

  AccountCharacterService accountCharacterService = AccountCharacterService();
  final GlobalKey<ScaffoldState> key = GlobalKey();

  void logoutAccount() {
    logout();
  }

  Future<void> logoutAccountCharacter() async {
    showLoading();
    await accountCharacterService.logoutAccountCharacter().then(
      (result) {
        navigateOffAll(accountCharacterRoute);
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
