import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:piece_fruits/src/components/custom_app_bar.dart';
import 'package:piece_fruits/src/components/gradient_button.dart';
import 'package:piece_fruits/src/components/loading_overlay.dart';
import 'package:piece_fruits/src/constants/image_constant.dart';
import 'package:piece_fruits/src/controllers/character_controller.dart';
import 'package:piece_fruits/src/models/character_model.dart';
import 'package:piece_fruits/src/models/response_model.dart';
import 'package:piece_fruits/src/utils/functions.dart';
import 'package:piece_fruits/src/utils/widgets.dart';

class CharacterPage extends GetView<CharacterController> {
  const CharacterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const int quantityCharactersMax = 4;

    return SafeArea(
      child: LoadingOverlay(
        child: Scaffold(
          extendBodyBehindAppBar: true,
          appBar: CustomAppBar(
            title: 'characters.page.title'.tr,
            offset: controller.offset.value,
          ),
          body: controller.obx(
            (state) => SingleChildScrollView(
              controller: controller.scrollController,
              physics: const BouncingScrollPhysics(),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      const SizedBox(height: 20),
                      GridView.builder(
                        clipBehavior: Clip.none,
                        physics: const BouncingScrollPhysics(),
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
                            final CharacterModel character = state[index];
                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    ShaderMask(
                                      shaderCallback: (rect) {
                                        return LinearGradient(
                                          begin: Alignment.topCenter,
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
                                          character.character!.id!,
                                          character.image!,
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () => {},
                                      icon: const Icon(Icons.delete),
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
                                                Colors.black45.withOpacity(0.2),
                                                BlendMode.srcATop,
                                              ),
                                              child: Image.asset(pirateIcon),
                                            ),
                                            Container(
                                              padding: const EdgeInsets.all(2),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: Colors.black
                                                    .withOpacity(0.5),
                                              ),
                                              child: Text(
                                                character.level.toString(),
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
                                    Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(character.name!),
                                          const SizedBox(height: 5),
                                          SizedBox(
                                            width: double.infinity,
                                            child: LinearPercentIndicator(
                                              barRadius:
                                                  const Radius.circular(50),
                                              lineHeight: 14,
                                              percent: 0.9,
                                              backgroundColor:
                                                  const Color(0xff26143f),
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
                                            title: 'Jogar',
                                            fontSize: 13,
                                            callback: () => {},
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          } else {
                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Center(
                                  child: GradientButton(
                                    title: 'Criar',
                                    fontSize: 13,
                                    callback: () => {},
                                  ),
                                ),
                              ),
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 20),
                      const InkWell(
                        onTap: logout,
                        child: Center(
                          child: Text('Sair'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            onEmpty: getError(),
            onError: (dynamic error) {
              final ResponseModel responseModel = responseModelFromJson(error);
              return getError(message: responseModel.message);
            },
            onLoading: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ),
      ),
    );
  }
}
