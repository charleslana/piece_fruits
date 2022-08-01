// ignore_for_file: use_setters_to_change_properties

import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:just_the_tooltip/just_the_tooltip.dart';
import 'package:piece_fruits/src/components/custom_app_bar.dart';
import 'package:piece_fruits/src/components/custom_shader_mask.dart';
import 'package:piece_fruits/src/components/gradient_button.dart';
import 'package:piece_fruits/src/components/loading_overlay.dart';
import 'package:piece_fruits/src/constants/color_constant.dart';
import 'package:piece_fruits/src/constants/data_constant.dart';
import 'package:piece_fruits/src/constants/image_constant.dart';
import 'package:piece_fruits/src/controllers/create_account_character_controller.dart';
import 'package:piece_fruits/src/models/character_model.dart';
import 'package:piece_fruits/src/models/response_model.dart';
import 'package:piece_fruits/src/utils/functions.dart';
import 'package:piece_fruits/src/utils/widgets.dart';

class CreateAccountCharacterPage
    extends GetView<CreateAccountCharacterController> {
  const CreateAccountCharacterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Builder(builder: (context) {
        return Obx(() {
          return Scaffold(
            extendBodyBehindAppBar: true,
            appBar: CustomAppBar(
              title: 'create.account.character.page.title'.tr,
              offset: controller.offset.value,
              isGoBack: true,
            ),
            body: LoadingOverlay(
              child: Center(
                child: controller.obx(
                  (state) => SingleChildScrollView(
                    controller: controller.scrollController,
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Obx(() {
                        return Stepper(
                          physics: const ScrollPhysics(),
                          controlsBuilder: _controlsBuilder,
                          currentStep: controller.currentStep.value,
                          onStepTapped: _onStepTapped,
                          onStepContinue: _onStepContinue,
                          onStepCancel: _onStepCancel,
                          steps: [
                            _infoSTep(),
                            _characterStep(state),
                            _resultStep(),
                          ],
                        );
                      }),
                    ),
                  ),
                  onEmpty: getError(),
                  onError: (dynamic error) {
                    final ResponseModel responseModel =
                        responseModelFromJson(error);
                    return getError(message: responseModel.message);
                  },
                  onLoading: const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                    ),
                  ),
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () => _showDialog(context),
              child: const Icon(Icons.info),
            ),
          );
        });
      }),
    );
  }

  void _onStepTapped(int step) {
    if (controller.createAccountCharacterFormKey.currentState!.validate()) {
      controller.currentStep.value = step;
      controller.goToTop();
    }
  }

  void _onStepContinue() {
    if (controller.createAccountCharacterFormKey.currentState!.validate() &&
        controller.currentStep.value < 2) {
      controller.currentStep.value += 1;
      controller.goToTop();
    }
  }

  void _onStepCancel() {
    if (controller.currentStep.value > 0) {
      controller.currentStep.value -= 1;
      controller.goToTop();
    }
  }

  StepState _stepState(int step) {
    if (controller.currentStep.value > step) {
      return StepState.complete;
    }
    return StepState.editing;
  }

  Step _infoSTep() {
    return Step(
      title: Text('create.account.character.page.first.title'.tr),
      subtitle: Text(
        'create.account.character.page.first.subtitle'.tr,
        style: const TextStyle(
          color: Colors.black,
        ),
      ),
      content: Form(
        key: controller.createAccountCharacterFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              maxLength: 20,
              decoration: InputDecoration(
                  counterStyle: const TextStyle(color: Colors.black),
                  errorMaxLines: 5,
                  labelText:
                      'create.account.character.page.step.first.name'.tr),
              validator: controller.validator,
            ),
            const SizedBox(height: 10),
            Text('create.account.character.page.step.first.faction'.tr),
            DropdownButton<String>(
              iconEnabledColor: Colors.black,
              iconDisabledColor: Colors.black,
              underline: Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.black45,
                    ),
                  ),
                ),
              ),
              isExpanded: true,
              items: factions.map((String faction) {
                return DropdownMenuItem<String>(
                  value: faction,
                  child: Text(toFaction(faction)),
                );
              }).toList(),
              onChanged: (String? value) => controller.faction.value = value,
              value: controller.faction.value,
            ),
          ],
        ),
      ),
      isActive: controller.currentStep.value >= 0,
      state: _stepState(0),
    );
  }

  Step _characterStep(List<CharacterModel>? state) {
    return Step(
      title: Text('create.account.character.page.step.two.title'.tr),
      content: GridView.builder(
          physics: const ScrollPhysics(),
          shrinkWrap: true,
          itemCount: state!.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.90,
          ),
          itemBuilder: (BuildContext context, int index) {
            final CharacterModel character = state[index];
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 375),
              child: SlideAnimation(
                verticalOffset: 50,
                child: FadeInAnimation(
                  child: InkWell(
                    onTap: () {
                      controller
                        ..characterId.value = character.id
                        ..characterName.value = character.name;
                    },
                    child: Obx(() {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: controller.characterId.value! == character.id
                              ? Border.all(
                                  width: 5,
                                )
                              : null,
                        ),
                        child: JustTheTooltip(
                          backgroundColor: Colors.black87,
                          margin: const EdgeInsets.only(
                            left: 20,
                            right: 20,
                          ),
                          content: Padding(
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              character.name!,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(5),
                              child: CustomShaderMask(
                                image: getThumbnailAvatar(
                                  character.id!,
                                  character.avatars!.first.image!,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
              ),
            );
          }),
      isActive: controller.currentStep >= 0,
      state: _stepState(1),
    );
  }

  Step _resultStep() {
    return Step(
      title: Text('create.account.character.page.step.three.title'.tr),
      content: Column(
        children: [
          _stepResult('create.account.character.page.step.three.row.first'.tr,
              controller.name.value),
          _stepResult('create.account.character.page.step.three.row.two'.tr,
              controller.characterName.value!),
          _stepResult('create.account.character.page.step.three.row.three'.tr,
              toFaction(controller.faction.value!)),
        ],
      ),
      isActive: controller.currentStep >= 0,
      state: _stepState(2),
    );
  }

  Widget _controlsBuilder(
      BuildContext context, ControlsDetails controlsDetails) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (controller.currentStep.value != 0)
            GradientButton(
              title: 'create.account.character.page.button.back'.tr,
              callback: controlsDetails.onStepCancel,
            ),
          GradientButton(
            title: controller.currentStep.value < 2
                ? 'create.account.character.page.button.next'.tr
                : 'create.account.character.page.button.complete'.tr,
            callback: controller.currentStep.value < 2
                ? controlsDetails.onStepContinue
                : controller.create,
          ),
        ],
      ),
    );
  }

  Widget _stepResult(String key, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Wrap(
            children: [
              Text(key),
              const SizedBox(width: 5),
              Text(
                value,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _showDialog(BuildContext context) {
    showDialog<dynamic>(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(
          'create.account.character.page.dialog.title'.tr,
          textAlign: TextAlign.center,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        backgroundColor: backgroundColor,
        scrollable: true,
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('create.account.character.page.dialog.content.first'.tr),
            const SizedBox(height: 5),
            Text('create.account.character.page.dialog.content.two'.tr),
            const SizedBox(height: 5),
            Text('create.account.character.page.dialog.content.three'.tr),
            const SizedBox(height: 5),
            Text('create.account.character.page.dialog.content.four'.tr),
          ],
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          GradientButton(
            title: 'create.account.character.page.dialog.button'.tr,
            callback: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
