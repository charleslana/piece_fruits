import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:piece_fruits/src/components/gradient_button.dart';
import 'package:piece_fruits/src/constants/route_constant.dart';
import 'package:piece_fruits/src/utils/functions.dart';

Widget getError({String? message}) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: message != null ? Text(message) : const Text('No data found'),
        ),
        const SizedBox(height: 10),
        GradientButton(
          title: 'connection.login.button'.tr,
          callback: () => navigateOff(loginRoute),
        ),
      ],
    ),
  );
}
