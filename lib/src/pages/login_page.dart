import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:piece_fruits/src/components/custom_app_bar.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: 'login.page.title'.tr),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Center(
            child: Text('login.page.title'.tr),
          ),
        ),
      ),
    );
  }
}
