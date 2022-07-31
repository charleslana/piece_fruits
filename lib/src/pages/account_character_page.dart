import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:piece_fruits/src/components/custom_app_bar.dart';
import 'package:piece_fruits/src/components/custom_shader_mask.dart';
import 'package:piece_fruits/src/components/gradient_button.dart';
import 'package:piece_fruits/src/components/loading_overlay.dart';
import 'package:piece_fruits/src/constants/color_constant.dart';
import 'package:piece_fruits/src/constants/image_constant.dart';
import 'package:piece_fruits/src/constants/route_constant.dart';
import 'package:piece_fruits/src/controllers/account_character_controller.dart';
import 'package:piece_fruits/src/models/account_character_model.dart';
import 'package:piece_fruits/src/models/response_model.dart';
import 'package:piece_fruits/src/utils/functions.dart';
import 'package:piece_fruits/src/utils/widgets.dart';

class AccountCharacterPage extends GetView<AccountCharacterController> {
  const AccountCharacterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int quantityCharactersMax = 4;

    return SafeArea(
      child: LoadingOverlay(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: CustomAppBar(
            title: 'account.character.page.title'.tr,
            offset: controller.offset.value,
          ),
          body: controller.obx(
            (state) => SingleChildScrollView(
              controller: controller.scrollController,
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    GridView.builder(
                      physics: const ScrollPhysics(),
                      clipBehavior: Clip.none,
                      shrinkWrap: true,
                      itemCount: quantityCharactersMax,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 0.65,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        if (state!.length > index) {
                          final AccountCharacterModel accountCharacter =
                              state[index];
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 375),
                            child: SlideAnimation(
                              verticalOffset: 50,
                              child: FadeInAnimation(
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(5),
                                    child: Stack(
                                      clipBehavior: Clip.none,
                                      children: [
                                        Align(
                                          alignment: Alignment.topCenter,
                                          child: CustomShaderMask(
                                            image: getThumbnailAvatar(
                                              accountCharacter.character!.id!,
                                              accountCharacter.image!,
                                            ),
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () => showConfirmation(
                                              () => controller.delete(
                                                  accountCharacter.id!)),
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.redAccent,
                                          ),
                                        ),
                                        Positioned(
                                          top: -25,
                                          right: -25,
                                          child: SizedBox(
                                            height: 40,
                                            child: Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                ColorFiltered(
                                                  colorFilter: ColorFilter.mode(
                                                    Colors.black45
                                                        .withOpacity(0.2),
                                                    BlendMode.srcATop,
                                                  ),
                                                  child: Image.asset(
                                                      showFactionImage(
                                                          accountCharacter
                                                              .faction!)),
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(2),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.black
                                                        .withOpacity(0.5),
                                                  ),
                                                  child: Text(
                                                    accountCharacter.level
                                                        .toString(),
                                                    style: const TextStyle(
                                                      fontSize: 17,
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Text(accountCharacter.name!),
                                            const SizedBox(height: 5),
                                            SizedBox(
                                              width: double.infinity,
                                              child: LinearPercentIndicator(
                                                barRadius:
                                                    const Radius.circular(50),
                                                lineHeight: 14,
                                                percent: 0.5,
                                                backgroundColor:
                                                    backgroundColor,
                                                progressColor: Colors.redAccent,
                                                center: const Text(
                                                  '300/300',
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            const SizedBox(height: 7),
                                            GradientButton(
                                              title:
                                                  'account.character.page.play.button'
                                                      .tr,
                                              fontSize: 13,
                                              callback: () => controller
                                                  .select(accountCharacter.id!),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        } else {
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 375),
                            child: SlideAnimation(
                              verticalOffset: 50,
                              child: FadeInAnimation(
                                child: Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Center(
                                      child: GradientButton(
                                        title:
                                            'account.character.page.create.button'
                                                .tr,
                                        fontSize: 13,
                                        callback: () => navigate(
                                            createAccountCharacterRoute),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    const IconButton(
                      onPressed: logout,
                      icon: Icon(
                        Icons.logout,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            onEmpty: getError(),
            onError: (dynamic error) {
              final ResponseModel responseModel = responseModelFromJson(error);
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
    );
  }
}
