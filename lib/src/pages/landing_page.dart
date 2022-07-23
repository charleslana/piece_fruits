import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:piece_fruits/src/components/app_logo.dart';
import 'package:piece_fruits/src/components/app_version.dart';
import 'package:piece_fruits/src/components/custom_app_bar.dart';
import 'package:piece_fruits/src/components/gradient_button.dart';
import 'package:piece_fruits/src/components/starter_bg.dart';
import 'package:piece_fruits/src/controllers/landing_controller.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final LandingController controller = Get.find<LandingController>();

    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: const CustomAppBar(),
        body: Stack(
          children: [
            const StarterBg(),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    const SizedBox(height: 56),
                    const AppLogo(),
                    const SizedBox(height: 20),
                    Obx(() {
                      return Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Visibility(
                                visible: controller.isLoading.value,
                                child: Column(
                                  children: const [
                                    LinearProgressIndicator(),
                                    SizedBox(height: 5),
                                  ],
                                ),
                              ),
                              Text(
                                controller.text.value,
                                style: const TextStyle(fontFamily: 'Lato'),
                                textAlign: TextAlign.center,
                              ),
                              Visibility(
                                visible: controller.isFailure.value,
                                child: Column(
                                  children: [
                                    const SizedBox(height: 5),
                                    GradientButton(
                                      title:
                                          'landing.page.try.connect.button'.tr,
                                      callback: controller.tryConnect,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ],
                ),
              ),
            ),
            const AppVersion(),
          ],
        ),
      ),
    );
  }
}
