import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:piece_fruits/src/components/card_form.dart';
import 'package:piece_fruits/src/components/custom_app_bar.dart';
import 'package:piece_fruits/src/components/gradient_button.dart';
import 'package:piece_fruits/src/components/loading_overlay.dart';
import 'package:piece_fruits/src/components/starter_bg.dart';
import 'package:piece_fruits/src/constants/data_constant.dart';
import 'package:piece_fruits/src/controllers/register_controller.dart';
import 'package:piece_fruits/src/services/language_service.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RegisterController controller = Get.find<RegisterController>();

    return SafeArea(
      child: Obx(() {
        return LoadingOverlay(
          child: Scaffold(
            extendBodyBehindAppBar: true,
            appBar: CustomAppBar(
              title: 'register.page.title'.tr,
              offset: controller.offset.value,
              isGoBack: true,
            ),
            body: Stack(
              children: [
                const StarterBg(),
                Center(
                  child: SingleChildScrollView(
                    controller: controller.scrollController,
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          const SizedBox(height: 56),
                          CardForm(
                            widget: Form(
                              key: controller.registerFormKey,
                              child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    TextFormField(
                                      controller: controller.emailController,
                                      decoration: InputDecoration(
                                          labelText: 'register.page.email'.tr),
                                      validator: (String? value) => controller
                                          .validator(value, isValidEmail: true),
                                    ),
                                    const SizedBox(height: 20),
                                    TextFormField(
                                      controller: controller.passwordController,
                                      decoration: InputDecoration(
                                          labelText:
                                              'register.page.password'.tr),
                                      validator: (String? value) =>
                                          controller.validator(value,
                                              isPasswordConfirmation: true),
                                      obscureText: true,
                                    ),
                                    const SizedBox(height: 20),
                                    TextFormField(
                                      controller: controller
                                          .passwordConfirmationController,
                                      decoration: InputDecoration(
                                          labelText:
                                              'register.page.password.confirmation'
                                                  .tr),
                                      validator: (String? value) =>
                                          controller.validator(value,
                                              isPasswordConfirmation: true),
                                      obscureText: true,
                                    ),
                                    const SizedBox(height: 20),
                                    Text('register.page.gender'.tr),
                                    Row(
                                      children: genders.map((gender) {
                                        return Expanded(
                                          child: Wrap(
                                            crossAxisAlignment:
                                                WrapCrossAlignment.center,
                                            spacing: 2,
                                            runSpacing: 2,
                                            children: [
                                              Radio<String>(
                                                value: gender,
                                                groupValue:
                                                    controller.gender.value,
                                                onChanged: (value) => controller
                                                    .gender.value = value,
                                              ),
                                              InkWell(
                                                onTap: () => controller
                                                    .gender.value = gender,
                                                child: Text(controller
                                                    .toGender(gender)),
                                              ),
                                            ],
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                    const SizedBox(height: 20),
                                    TextFormField(
                                      readOnly: true,
                                      controller:
                                          controller.birthDateController,
                                      decoration: InputDecoration(
                                        labelText:
                                            'register.page.birth.date'.tr,
                                      ),
                                      validator: controller.validator,
                                      onTap: () async {
                                        await showDatePicker(
                                          locale: LanguageService().getLocale(),
                                          initialDatePickerMode:
                                              DatePickerMode.year,
                                          context: context,
                                          initialDate: DateTime.now(),
                                          firstDate: DateTime(1950),
                                          lastDate: DateTime.now(),
                                        ).then((selectedDate) {
                                          if (selectedDate != null) {
                                            final DateFormat formatter =
                                                DateFormat.yMMMd(
                                                    LanguageService()
                                                        .getStringLocale());
                                            controller
                                                    .birthDateController.text =
                                                formatter.format(selectedDate);
                                            controller.birthDate.value =
                                                selectedDate;
                                          }
                                        });
                                      },
                                    ),
                                    const SizedBox(height: 20),
                                    GradientButton(
                                      title: 'register.page.button'.tr,
                                      callback: controller.register,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          InkWell(
                            onTap: () => {},
                            child: RichText(
                              text: TextSpan(
                                text: 'register.page.service.terms.text'.tr,
                                children: [
                                  TextSpan(
                                    text:
                                        'register.page.service.terms.action'.tr,
                                    style: const TextStyle(
                                      decoration: TextDecoration.underline,
                                    ),
                                  ),
                                ],
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Dosis',
                                ),
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
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
