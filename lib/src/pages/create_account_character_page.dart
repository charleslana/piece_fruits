// ignore_for_file: use_setters_to_change_properties

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:piece_fruits/src/components/custom_app_bar.dart';
import 'package:piece_fruits/src/components/gradient_button.dart';
import 'package:piece_fruits/src/components/loading_overlay.dart';
import 'package:piece_fruits/src/constants/image_constant.dart';
import 'package:piece_fruits/src/controllers/create_account_character_controller.dart';
import 'package:piece_fruits/src/models/character_model.dart';
import 'package:piece_fruits/src/models/response_model.dart';
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
              title: 'Criar personagem',
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
                          controlsBuilder: controlsBuilder,
                          currentStep: controller.currentStep.value,
                          onStepTapped: _onStepTapped,
                          onStepContinue: _onStepContinue,
                          onStepCancel: _onStepCancel,
                          steps: [
                            _nameSTep(),
                            _characterStep(state),
                            _factionStep(),
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
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
            ),
          );
        });
      }),
    );
  }

  void _onStepTapped(int step) => controller.currentStep.value = step;

  void _onStepContinue() {
    if (controller.currentStep.value < 2) {
      controller.currentStep.value += 1;
    }
  }

  void _onStepCancel() {
    if (controller.currentStep.value > 0) {
      controller.currentStep.value -= 1;
    }
  }

  StepState _stepState(int step) {
    if (controller.currentStep.value > step) {
      return StepState.complete;
    }
    return StepState.editing;
  }

  Step _nameSTep() {
    return Step(
      title: const Text('Informações do personagem'),
      content: TextFormField(
        decoration: const InputDecoration(labelText: 'Nome do personagem'),
      ),
      isActive: controller.currentStep.value >= 0,
      state: _stepState(0),
    );
  }

  Step _characterStep(List<CharacterModel>? state) {
    return Step(
      title: const Text('Personagem'),
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
            return Card(
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: ShaderMask(
                  shaderCallback: (rect) {
                    return LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black,
                        Colors.black.withOpacity(0.8),
                        Colors.transparent
                      ],
                    ).createShader(
                      Rect.fromLTRB(
                        0,
                        0,
                        rect.width,
                        rect.height,
                      ),
                    );
                  },
                  blendMode: BlendMode.dstIn,
                  child: Image.asset(
                    getThumbnailAvatar(
                      character.id!,
                      character.avatars!.first.image!,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          }),
      isActive: controller.currentStep >= 0,
      state: _stepState(1),
    );
  }

  Step _factionStep() {
    return Step(
      title: const Text('Facção'),
      content: Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Mobile Number'),
          ),
        ],
      ),
      isActive: controller.currentStep >= 0,
      state: _stepState(2),
    );
  }

  Widget controlsBuilder(
      BuildContext context, ControlsDetails controlsDetails) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GradientButton(
            title: controller.currentStep.value < 2 ? 'Próximo' : 'Concluir',
            callback: controlsDetails.onStepContinue,
          ),
          if (controller.currentStep.value != 0)
            GradientButton(
              title: 'Voltar',
              callback: controlsDetails.onStepCancel,
            ),
        ],
      ),
    );
  }
}
