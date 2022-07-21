import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:piece_fruits/src/components/card_form.dart';
import 'package:piece_fruits/src/components/custom_app_bar.dart';
import 'package:piece_fruits/src/components/gradient_button.dart';
import 'package:piece_fruits/src/components/loading_overlay.dart';
import 'package:piece_fruits/src/constants/image_constant.dart';
import 'package:piece_fruits/src/constants/route_constant.dart';
import 'package:piece_fruits/src/controllers/login_controller.dart';
import 'package:piece_fruits/src/utils/functions.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.find<LoginController>();

    return SafeArea(
      child: Obx(() {
        return LoadingOverlay(
          child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: CustomAppBar(
              title: 'login.page.title'.tr,
              offset: controller.offset.value,
            ),
            body: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage(starterBg),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.4),
                        BlendMode.srcOver,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: SingleChildScrollView(
                    controller: controller.scrollController,
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          const SizedBox(height: 56),
                          SizedBox(
                            height: 100,
                            child: Image.asset(
                              pieceFruitsLogo,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(height: 20),
                          CardForm(
                            widget: Form(
                              key: controller.loginFormKey,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    TextFormField(
                                      controller: controller.emailController,
                                      decoration: InputDecoration(
                                          labelText: 'login.page.email'.tr),
                                      validator: (String? value) => controller
                                          .validator(value, isValidEmail: true),
                                    ),
                                    const SizedBox(height: 20),
                                    TextFormField(
                                      controller: controller.passwordController,
                                      decoration: InputDecoration(
                                          labelText: 'login.page.password'.tr),
                                      validator: controller.validator,
                                      obscureText: true,
                                    ),
                                    const SizedBox(height: 20),
                                    GradientButton(
                                      title: 'login.page.button'.tr,
                                      callback: controller.login,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: Text(
                              'login.page.have.registration'.tr,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          GradientButton(
                            title: 'login.page.register.button'.tr,
                            callback: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              controller.goToTop();
                              navigate(registerRoute);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Powered by Charles Games',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Versão 1.0.0',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
