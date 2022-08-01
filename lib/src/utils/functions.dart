import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:piece_fruits/src/constants/route_constant.dart';
import 'package:piece_fruits/src/enums/toast_enum.dart';
import 'package:piece_fruits/src/models/response_model.dart';
import 'package:piece_fruits/src/services/login_service.dart';
import 'package:url_launcher/url_launcher.dart';

void _closeToast() {
  if (Get.isSnackbarOpen) {
    Get.back<dynamic>();
    return;
  }
}

double calculateBar(int attribute, List<int> attributes) {
  final int sumAttributes =
      attributes.fold<int>(0, (int sum, int item) => sum + item);
  final double percent = attribute / sumAttributes;
  if (percent > 1) {
    return 1;
  }
  return percent;
}

void closeKeyboard() {
  FocusManager.instance.primaryFocus?.unfocus();
}

void goBack() {
  Get.back<dynamic>();
}

Future<void> launchDiscord() async {
  final Uri url = Uri.parse('https://flutter.dev');
  if (!await launchUrl(url)) {
    throw Exception('Could not launch $url');
  }
}

void logout() {
  LoginService().removeLogin();
  navigateOff(loginRoute);
}

void navigate(String route) {
  Get.toNamed<dynamic>(route);
}

void navigateOff(String route) {
  Get.offNamed<dynamic>(route);
}

void navigateOffAll(String route) {
  Get.offAllNamed<dynamic>(route);
}

String numberAbbreviation(dynamic myNumber) {
  final String stringNumber = myNumber.toString();
  final double doubleNumber = double.tryParse(stringNumber) ?? 0;
  final NumberFormat numberFormat = NumberFormat.compact();
  return numberFormat.format(doubleNumber);
}

void showConfirmation(VoidCallback callback) {
  _closeToast();
  Get.defaultDialog<dynamic>(
    onConfirm: () => {
      goBack(),
      callback(),
    },
    onCancel: null,
    titleStyle: const TextStyle(color: Colors.red),
    confirmTextColor: Colors.red,
    cancelTextColor: Colors.black,
    buttonColor: const Color(0xffd0b562),
    backgroundColor: const Color(0xffd0b562),
    textCancel: 'dialog.confirmation.cancel.button'.tr,
    textConfirm: 'dialog.confirmation.confirm.button'.tr,
    title: 'dialog.confirmation.title'.tr,
    middleText: 'dialog.confirmation.content'.tr,
    radius: 20,
  );
}

String showConnectionFailure() {
  return responseModelToJson(ResponseModel(
    status: '503',
    message: 'connection.failure'.tr,
  ));
}

void showLoading() {
  Get.dialog<dynamic>(
    WillPopScope(
      onWillPop: () async => false,
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    ),
    barrierDismissible: false,
  );
}

void showToast(String message, ToastEnum toast) {
  _closeToast();
  Get.rawSnackbar(
    messageText: Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: toast == ToastEnum.error ? Colors.red : Colors.green[900],
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 6,
            vertical: 2,
          ),
          child: Text(
            message,
            style: const TextStyle(
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
    backgroundColor: Colors.transparent,
    dismissDirection: DismissDirection.horizontal,
    forwardAnimationCurve: Curves.fastLinearToSlowEaseIn,
    reverseAnimationCurve: Curves.easeOut,
    borderRadius: 10,
    margin: const EdgeInsets.all(15),
    animationDuration: const Duration(),
    duration: const Duration(seconds: 4),
  );
}

String toGender(String gender) {
  switch (gender) {
    case 'MALE':
      return 'gender.male'.tr;
    case 'FEMALE':
      return 'gender.female'.tr;
    default:
      return 'gender.other'.tr;
  }
}

String toFaction(String faction) {
  switch (faction) {
    case 'PIRATE':
      return 'faction.pirate'.tr;
    case 'MARINE':
      return 'faction.marine'.tr;
    default:
      return 'faction.revolutionary'.tr;
  }
}
