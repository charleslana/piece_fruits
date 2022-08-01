import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:piece_fruits/src/components/custom_app_bar.dart';
import 'package:piece_fruits/src/controllers/create_account_character_controller.dart';
import 'package:piece_fruits/src/models/response_model.dart';
import 'package:piece_fruits/src/utils/widgets.dart';

class ModelPage extends GetView<CreateAccountCharacterController> {
  const ModelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: CustomAppBar(
            title: 'Criar personagem',
            offset: controller.offset.value,
            isGoBack: true,
          ),
          body: Center(
            child: controller.obx(
              (state) => SingleChildScrollView(
                controller: controller.scrollController,
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: const [
                      SizedBox(height: 20),
                    ],
                  ),
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
        );
      }),
    );
  }
}
