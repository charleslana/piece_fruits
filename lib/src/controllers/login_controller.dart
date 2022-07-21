import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:piece_fruits/src/constants/route_constant.dart';
import 'package:piece_fruits/src/enums/toast_enum.dart';
import 'package:piece_fruits/src/interfaces/custom_app_bar_abstract.dart';
import 'package:piece_fruits/src/interfaces/form_validator.dart';
import 'package:piece_fruits/src/models/api_error_model.dart';
import 'package:piece_fruits/src/services/login_service.dart';
import 'package:piece_fruits/src/utils/functions.dart';

class LoginController extends GetxController
    with FormValidator
    implements CustomAppBarAbstract {
  LoginController({
    required this.loginService,
  });

  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final ScrollController scrollController = ScrollController();
  LoginService loginService = LoginService();
  RxDouble offset = RxDouble(0);

  @override
  void onInit() {
    listenScrollController();
    super.onInit();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
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

  void login() {
    if (loginFormKey.currentState!.validate()) {
      showLoading();
      validateLogin(emailController.text, passwordController.text);
    }
  }

  Future<void> validateLogin(String email, String password) async {
    await loginService.login(email, password).then(
      (result) {
        result = result.copyWith(password: password);
        loginService.saveLogin(result);
        navigateOff(charactersRoute);
        hideLoading();
      },
      onError: (dynamic error) {
        hideLoading();
        passwordController.clear();
        final ApiErrorModel apiErrorModel = apiErrorModelFromJson(error);
        showToast(apiErrorModel.message!, ToastEnum.error);
      },
    );
  }

  String? validator(String? value, {bool? isValidEmail}) {
    if (value == null || value.trim().isEmpty) {
      return 'validation.field.empty'.tr;
    }
    if (isValidEmail != null && !isEmail(value.trim())) {
      return 'validation.field.email'.tr;
    }
    return null;
  }
}