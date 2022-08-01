import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:piece_fruits/src/constants/data_constant.dart';
import 'package:piece_fruits/src/constants/route_constant.dart';
import 'package:piece_fruits/src/enums/toast_enum.dart';
import 'package:piece_fruits/src/interfaces/custom_scroll_abstract.dart';
import 'package:piece_fruits/src/interfaces/form_validator.dart';
import 'package:piece_fruits/src/models/register_model.dart';
import 'package:piece_fruits/src/models/response_model.dart';
import 'package:piece_fruits/src/services/register_service.dart';
import 'package:piece_fruits/src/utils/functions.dart';

class RegisterController extends GetxController
    with FormValidator
    implements CustomScrollAbstract {
  RegisterController({
    required this.registerService,
  });

  RegisterService registerService = RegisterService();
  final ScrollController scrollController = ScrollController();
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  RxDouble offset = RxDouble(0);
  RxnString gender = RxnString();
  Rxn<DateTime> birthDate = Rxn<DateTime>();

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
    gender.value = genders.first;
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

  void register() {
    closeKeyboard();
    if (registerFormKey.currentState!.validate()) {
      showLoading();
      final RegisterModel registerModel = RegisterModel(
        email: emailController.text,
        password: passwordController.text,
        gender: gender.value!,
        birthDate:
            DateTime.parse(DateFormat('yyyy-MM-dd').format(birthDate.value!)),
      );
      validateRegister(registerModel);
    }
  }

  Future<void> validateRegister(RegisterModel register) async {
    await registerService.register(register).then(
      (result) {
        showToast(result.message!, ToastEnum.success);
        navigateOffAll(loginRoute);
      },
      onError: (dynamic error) {
        goBack();
        final ResponseModel responseModel = responseModelFromJson(error);
        showToast(responseModel.message!, ToastEnum.error);
      },
    );
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
}
