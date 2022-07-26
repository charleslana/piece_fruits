import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:piece_fruits/src/components/custom_app_bar.dart';
import 'package:piece_fruits/src/components/custom_bottom_navigation_bar.dart';
import 'package:piece_fruits/src/components/custom_shader_mask.dart';
import 'package:piece_fruits/src/components/gradient_button.dart';
import 'package:piece_fruits/src/components/rpg_awesome_icons.dart';
import 'package:piece_fruits/src/components/side_bar.dart';
import 'package:piece_fruits/src/constants/color_constant.dart';
import 'package:piece_fruits/src/constants/image_constant.dart';
import 'package:piece_fruits/src/controllers/overview_controller.dart';
import 'package:piece_fruits/src/models/response_model.dart';
import 'package:piece_fruits/src/utils/functions.dart';
import 'package:piece_fruits/src/utils/widgets.dart';

class OverviewPage extends GetView<OverviewController> {
  const OverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() {
        return Scaffold(
          key: controller.sideBarController.key,
          extendBodyBehindAppBar: true,
          appBar: CustomAppBar(
            title: 'overview.page.title'.tr,
            offset: controller.offset.value,
            minOffset: 10,
          ),
          body: controller.obx(
            (state) {
              final List<int> attributes = [
                state!.attribute!.punch!,
                state.attribute!.defense!,
                state.attribute!.sword!,
                state.attribute!.weapon!,
                state.attribute!.fruit!,
              ];
              return SingleChildScrollView(
                controller: controller.scrollController,
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    const SizedBox(height: 56),
                    SizedBox(
                      height: 250,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: lightBackgroundColor.withOpacity(0.3),
                            ),
                            width: double.infinity,
                            height: 250,
                            child: CustomShaderMask(
                              image: getPortraitAvatar(
                                state.character!.id!,
                                state.image!,
                              ),
                              fit: BoxFit.contain,
                            ),
                          ),
                          Positioned(
                            top: 5,
                            right: 5,
                            child: OutlinedButton.icon(
                              onPressed: () => {},
                              icon: const Icon(
                                Icons.star,
                                color: Colors.white,
                                size: 20,
                              ),
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color>(
                                        (states) {
                                  if (states.contains(MaterialState.disabled)) {
                                    return Colors.grey.withOpacity(0.5);
                                  }
                                  return Colors.orangeAccent;
                                }),
                              ),
                              label: Text(
                                'overview.page.premium.button'.tr,
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: SizedBox(
                        height: 30,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Positioned(
                              top: -30,
                              child: Row(
                                children: [
                                  Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      ColorFiltered(
                                        colorFilter: ColorFilter.mode(
                                          Colors.black45.withOpacity(0.2),
                                          BlendMode.srcATop,
                                        ),
                                        child: SizedBox(
                                          height: 60,
                                          child: Image.asset(
                                              showFactionImage(state.faction!)),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.black.withOpacity(0.5),
                                        ),
                                        child: Text(
                                          state.level.toString(),
                                          style: const TextStyle(
                                            fontSize: 17,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(width: 5),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(state.name!),
                                      const SizedBox(height: 5),
                                      GradientButton(
                                        title: 'overview.page.edit.button'.tr,
                                        callback: () => {},
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Wrap(
                        alignment: WrapAlignment.spaceBetween,
                        runSpacing: 20,
                        spacing: Get.width * 0.10,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                toFaction(state.faction!),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('overview.page.faction'.tr),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'overview.page.no.crew'.tr,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('overview.page.crew'.tr),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              if (state.faction == 'PIRATE') ...[
                                Text(
                                  numberAbbreviation(state.bounty),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text('overview.page.bounty'.tr),
                              ] else ...[
                                Text(
                                  numberAbbreviation(state.fame),
                                  style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text('overview.page.fame'.tr),
                              ]
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                numberAbbreviation(state.power),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('overview.page.power'.tr),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: InkWell(
                        onTap: launchDiscord,
                        borderRadius: BorderRadius.circular(10),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Row(
                              children: [
                                const Icon(Icons.discord),
                                const SizedBox(width: 5),
                                Expanded(
                                  child: Text(
                                    'overview.page.discord.message'.tr,
                                    style: const TextStyle(fontSize: 13),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () => {},
                                    icon: const Icon(Icons.info),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    'overview.page.attributes'.tr,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              _columnAttribute(
                                'overview.page.attribute.punch'.tr,
                                attributes[0],
                                state.attribute!.punch!,
                                calculateAttributeBar(
                                    attributes[0], attributes),
                                RpgAwesome.muscle_up,
                              ),
                              _columnAttribute(
                                'overview.page.attribute.defense'.tr,
                                attributes[1],
                                state.attribute!.defense!,
                                calculateAttributeBar(
                                    attributes[1], attributes),
                                RpgAwesome.round_shield,
                              ),
                              _columnAttribute(
                                'overview.page.attribute.sword'.tr,
                                attributes[2],
                                state.attribute!.sword!,
                                calculateAttributeBar(
                                    attributes[2], attributes),
                                RpgAwesome.broadsword,
                              ),
                              _columnAttribute(
                                'overview.page.attribute.weapon'.tr,
                                attributes[3],
                                state.attribute!.weapon!,
                                calculateAttributeBar(
                                    attributes[3], attributes),
                                RpgAwesome.musket,
                              ),
                              _columnAttribute(
                                'overview.page.attribute.fruit'.tr,
                                attributes[4],
                                state.attribute!.fruit!,
                                calculateAttributeBar(
                                    attributes[4], attributes),
                                RpgAwesome.trefoil_lily,
                              ),
                              GradientButton(
                                title: 'overview.page.train.button'.tr,
                                callback: () => {},
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(
                                onPressed: () => {},
                                icon: const Icon(Icons.info),
                              ),
                              const SizedBox(width: 5),
                              Text(
                                'overview.page.statistics'.tr,
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          GridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: 4,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5,
                            childAspectRatio: 0.65,
                            padding: const EdgeInsets.only(top: 10),
                            children: [
                              _statisticsCard(
                                'overview.page.experience'.tr,
                                state.experience!,
                                1000,
                              ),
                              _statisticsCard(
                                'overview.page.honor.win'.tr,
                                state.honorWin!,
                                0,
                              ),
                              _statisticsCard(
                                'overview.page.total.battle'.tr,
                                state.totalBattle!,
                                0,
                              ),
                              _statisticsCard(
                                'overview.page.win'.tr,
                                state.win!,
                                0,
                              ),
                              _statisticsCard(
                                'overview.page.defeat'.tr,
                                state.defeat!,
                                0,
                              ),
                              _statisticsCard(
                                'overview.page.draw'.tr,
                                state.draw!,
                                0,
                              ),
                              _statisticsCard(
                                'overview.page.damage.hit'.tr,
                                state.damageHit!,
                                0,
                              ),
                              _statisticsCard(
                                'overview.page.damage.taken'.tr,
                                state.damageTaken!,
                                0,
                              ),
                              _statisticsCard(
                                'overview.page.belly.won'.tr,
                                state.bellyWon!,
                                0,
                              ),
                              _statisticsCard(
                                'overview.page.belly.lost'.tr,
                                state.bellyLost!,
                                0,
                              ),
                              _statisticsCard(
                                'overview.page.score'.tr,
                                state.score!,
                                0,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: lightBackgroundColor.withOpacity(0.3),
                          ),
                          width: double.infinity,
                          height: 150,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: _showBiography,
                                    icon: const Icon(Icons.edit),
                                  ),
                                  const SizedBox(width: 5),
                                  Text(
                                    'overview.page.biography'.tr,
                                    style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              Text(state.biography ??
                                  'overview.page.no.biography'.tr),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
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
          drawer: const SideBar(),
          bottomNavigationBar: const CustomBottomNavigationBar(),
        );
      }),
    );
  }

  Widget _columnAttribute(String attribute, int totalValue, int baseValue,
      double percent, IconData icon) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  totalValue.toString(),
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  attribute,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  baseValue.toString(),
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  'overview.page.base.attribute'.tr,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
        LinearPercentIndicator(
          barRadius: const Radius.circular(50),
          lineHeight: 14,
          percent: percent,
          backgroundColor: Colors.black.withOpacity(0.5),
          progressColor: lightBackgroundColor,
          leading: Icon(icon),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _statisticsCard(String title, int value, int position) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Expanded(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(title),
              ),
            ),
            Expanded(
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                  color: backgroundColor.withOpacity(0.5),
                  borderRadius: const BorderRadius.all(Radius.circular(3)),
                  border: Border.all(
                    color: Colors.black54,
                  ),
                ),
                child: Center(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      numberAbbreviation(value),
                      style: const TextStyle(
                        height: 0,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Flexible(
                    child: FaIcon(
                      FontAwesomeIcons.medal,
                      size: 15,
                    ),
                  ),
                  Flexible(
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        '$position º',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showBiography() {
    Get.bottomSheet<dynamic>(
      SizedBox(
        height: Get.height * 0.5,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: controller.overViewFormKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.biographyController,
                  maxLines: 7,
                  maxLength: 200,
                  decoration: InputDecoration(
                    errorMaxLines: 3,
                    hintText: 'overview.page.enter.biography'.tr,
                  ),
                  validator: controller.validator,
                ),
                const SizedBox(height: 10),
                GradientButton(
                  title: 'overview.page.biography.save.button'.tr,
                  fontSize: 13,
                  callback: controller.updateBiography,
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: backgroundColor,
    );
  }
}
