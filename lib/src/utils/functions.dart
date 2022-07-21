import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:piece_fruits/src/constants/route_constant.dart';
import 'package:piece_fruits/src/controllers/loading_overlay_controller.dart';
import 'package:piece_fruits/src/enums/toast_enum.dart';
import 'package:piece_fruits/src/models/api_error_model.dart';
import 'package:piece_fruits/src/services/login_service.dart';

void _closeToast() {
  if (Get.isSnackbarOpen) {
    Get.back<dynamic>();
    return;
  }
}

void goBack() {
  Get.back<dynamic>();
}

void hideLoading() {
  final LoadingOverlayController loadingOverlayController =
      Get.find<LoadingOverlayController>();
  loadingOverlayController.isLoading.value = false;
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

String showConnectionFailure() {
  return apiErrorModelToJson(ApiErrorModel(
    status: '503',
    message: 'connection.failure'.tr,
  ));
}

void showLoading() {
  final LoadingOverlayController loadingOverlayController =
      Get.find<LoadingOverlayController>();
  loadingOverlayController.isLoading.value = true;
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
