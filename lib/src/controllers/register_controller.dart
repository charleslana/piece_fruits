import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:piece_fruits/src/interfaces/custom_app_bar_abstract.dart';
import 'package:piece_fruits/src/interfaces/form_validator.dart';
import 'package:piece_fruits/src/utils/functions.dart';

class RegisterController extends GetxController
    with FormValidator
    implements CustomAppBarAbstract {
  final ScrollController scrollController = ScrollController();
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();
  RxDouble offset = RxDouble(0);

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    passwordConfirmationController.dispose();
    scrollController.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    listenScrollController();
    super.onInit();
  }

  @override
  void goToTop() {
    // TODO: implement goToTop
  }

  @override
  void listenScrollController() {
    scrollController.addListener(() {
      offset.value = scrollController.offset;
    });
  }

  String? validator(String? value,
      {bool? isValidEmail, bool? isPasswordConfirmation}) {
    if (value == null || value.trim().isEmpty) {
      return 'validation.field.empty'.tr;
    }
    if (isValidEmail != null && !isEmail(value.trim())) {
      return 'validation.field.email'.tr;
    }
    if (isPasswordConfirmation != null && value.trim().length < 6) {
      return 'validation.field.password.length'.tr;
    }
    if (isPasswordConfirmation != null &&
        passwordController.text.trim() !=
            passwordConfirmationController.text.trim()) {
      return 'validation.field.password.confirmation'.tr;
    }
    return null;
  }

  void register() {
    if (registerFormKey.currentState!.validate()) {
      showLoading();
    }
  }
}
