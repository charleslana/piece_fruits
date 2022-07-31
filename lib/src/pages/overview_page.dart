import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:piece_fruits/src/components/custom_app_bar.dart';
import 'package:piece_fruits/src/components/custom_bottom_navigation_bar.dart';
import 'package:piece_fruits/src/components/custom_shader_mask.dart';
import 'package:piece_fruits/src/components/gradient_button.dart';
import 'package:piece_fruits/src/components/loading_overlay.dart';
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
        return LoadingOverlay(
          child: Scaffold(
            key: controller.sideBarController.key,
            extendBodyBehindAppBar: true,
            appBar: CustomAppBar(
              title: 'Visão Geral',
              offset: controller.offset.value,
              isHome: true,
              minOffset: 10,
            ),
            body: controller.obx(
              (state) => SingleChildScrollView(
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
                                1,
                                '1',
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
                              label: const Text(
                                'Premium',
                                style: TextStyle(
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
                        height: 20,
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
                                          height: 50,
                                          child: Image.asset(
                                              showFactionImage('PIRATE')),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.black.withOpacity(0.5),
                                        ),
                                        child: const Text(
                                          '1',
                                          style: TextStyle(
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
                                      const Text('Test'),
                                      const SizedBox(height: 5),
                                      GradientButton(
                                        title: 'Editar',
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
                            children: const [
                              Text(
                                'Pirata',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('facção'),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Text(
                                'Nenhuma tripulação',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text('tripulação'),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                numberAbbreviation(10000),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text('bounty'),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                numberAbbreviation(5000),
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Text('poder'),
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
                              children: const [
                                Icon(Icons.discord),
                                SizedBox(width: 5),
                                Expanded(
                                  child: Text(
                                    'Toque para acessar o grupo do discord do jogo. Venha-se divertir com a comunidade e tire suas dúvidas.',
                                    style: TextStyle(fontSize: 13),
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
                                  const Text(
                                    'Atributos',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              _columnAttribute(
                                'Soco',
                                5,
                                5,
                                0.9,
                                RpgAwesome.muscle_up,
                              ),
                              _columnAttribute(
                                'Defesa',
                                5,
                                5,
                                0.9,
                                RpgAwesome.round_shield,
                              ),
                              _columnAttribute(
                                'Espada',
                                5,
                                5,
                                0.9,
                                RpgAwesome.broadsword,
                              ),
                              _columnAttribute(
                                'Arma',
                                5,
                                5,
                                0.9,
                                RpgAwesome.musket,
                              ),
                              _columnAttribute(
                                'Fruta',
                                5,
                                5,
                                0.9,
                                RpgAwesome.trefoil_lily,
                              ),
                              GradientButton(
                                title: 'Treinar',
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
                              const Text(
                                'Estatísticas',
                                style: TextStyle(
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
                                'Experiência',
                                10,
                                1000,
                              ),
                              _statisticsCard(
                                'Vitórias de honra',
                                5000,
                                0,
                              ),
                              _statisticsCard(
                                'Batalhas totais',
                                0,
                                0,
                              ),
                              _statisticsCard(
                                'Vitórias',
                                0,
                                0,
                              ),
                              _statisticsCard(
                                'Derrotas',
                                0,
                                0,
                              ),
                              _statisticsCard(
                                'Empates',
                                0,
                                0,
                              ),
                              _statisticsCard(
                                'Dano causado',
                                0,
                                0,
                              ),
                              _statisticsCard(
                                'Dano sofrido',
                                0,
                                0,
                              ),
                              _statisticsCard(
                                'Belly conquistado',
                                0,
                                0,
                              ),
                              _statisticsCard(
                                'Belly perdido',
                                0,
                                0,
                              ),
                              _statisticsCard(
                                'Pontos',
                                0,
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
                                  const Text(
                                    'Biografia',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const Text(
                                  "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type a"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
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
            drawer: const SideBar(),
            bottomNavigationBar: const CustomBottomNavigationBar(),
          ),
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
                const Text(
                  'base',
                  style: TextStyle(
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
        height: Get.height * 0.38,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const TextField(
                maxLines: 7,
                maxLength: 200,
                decoration:
                    InputDecoration.collapsed(hintText: 'Enter your text here'),
              ),
              const SizedBox(height: 10),
              GradientButton(
                title: 'Salvar',
                fontSize: 13,
                callback: () => {},
              ),
            ],
          ),
        ),
      ),
      backgroundColor: backgroundColor,
    );
  }
}
