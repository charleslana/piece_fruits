import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:piece_fruits/src/components/clock.dart';
import 'package:piece_fruits/src/constants/image_constant.dart';
import 'package:piece_fruits/src/constants/route_constant.dart';
import 'package:piece_fruits/src/controllers/side_bar_controller.dart';
import 'package:piece_fruits/src/utils/functions.dart';

class SideBar extends GetView<SideBarController> {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.8,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            SizedBox(
              height: 240,
              child: DrawerHeader(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 214, 177, 67),
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: Stack(
                        children: [
                          Positioned(
                            top: 10,
                            left: Get.width * 0.15,
                            child: Container(
                              width: Get.width * 0.30,
                              height: 20,
                              decoration: BoxDecoration(
                                color: const Color(0xffd0b562).withOpacity(0.5),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(3)),
                                border: Border.all(
                                  color: Colors.black54,
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  'Teste',
                                  style: TextStyle(
                                    height: 0,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 30,
                            left: Get.width * 0.15,
                            child: LinearPercentIndicator(
                              width: Get.width * 0.33,
                              barRadius: const Radius.circular(3),
                              lineHeight: 14,
                              percent: 1,
                              backgroundColor: const Color(0xffd0b562),
                              progressColor: Colors.redAccent,
                              center: const Text(
                                '300/300',
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 44,
                            left: Get.width * 0.10,
                            child: LinearPercentIndicator(
                              width: Get.width * 0.38,
                              barRadius: const Radius.circular(3),
                              lineHeight: 14,
                              percent: 1,
                              backgroundColor: const Color(0xffd0b562),
                              progressColor: Colors.blueAccent,
                              center: const Text(
                                '300/300',
                                style: TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Stack(
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.black54,
                                    radius: Get.width * 0.10,
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: CircleAvatar(
                                        radius: Get.width * 0.10,
                                        backgroundColor:
                                            const Color(0xffd0b562),
                                        backgroundImage: AssetImage(
                                            getThumbnailAvatar(1, '1')),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    left: 0,
                                    child: Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: Colors.black.withOpacity(0.5),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(50),
                                        ),
                                        border: Border.all(
                                          color: Colors.black54,
                                        ),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          '1',
                                          style: TextStyle(
                                            color: Colors.white,
                                            height: 0,
                                            fontSize: 13,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: Get.width * 0.15,
                                child: Image.asset(
                                  showFactionImage('PIRATE'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            const ImageIcon(
                              AssetImage(bellyIcon),
                              color: Colors.black,
                            ),
                            Text(numberAbbreviation(5000)),
                          ],
                        ),
                        Column(
                          children: [
                            const Icon(
                              IconData(
                                0xe9e4,
                                fontFamily: 'RpgAwesome',
                              ),
                              color: Colors.yellowAccent,
                            ),
                            Text(numberAbbreviation(0)),
                          ],
                        ),
                        Column(
                          children: [
                            const Icon(
                              IconData(
                                0xe9e0,
                                fontFamily: 'RpgAwesome',
                              ),
                              color: Colors.amberAccent,
                            ),
                            Text(numberAbbreviation(0)),
                          ],
                        ),
                      ],
                    ),
                    const Divider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _rowDrawerHeader(
                          Icons.access_time,
                          const Clock(),
                          'hora do jogo',
                        ),
                        _rowDrawerHeader(
                          Icons.shield_outlined,
                          const Text('Vulnerável'),
                          'imunidade',
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                  ],
                ),
              ),
            ),
            _listTile(
              'Visão geral',
              'Este é a visão geral dos dados do seu personagem',
              Icons.home,
              () => {
                Navigator.pop(context),
                navigate(overviewRoute),
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Divider(),
            ),
            _listTile(
              'Trocar de personagem',
              'Alterne entre os personagens da sua conta',
              Icons.switch_account_outlined,
              () => controller.logoutAccountCharacter(),
            ),
            _listTile(
              'Sair',
              'Faça logout da sua conta para realizar o login novamente',
              Icons.logout,
              () => controller.logoutAccount(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _rowDrawerHeader(IconData icon, Widget widget, String subtitle) {
    return Row(
      children: [
        Icon(
          icon,
          color: Colors.black,
          size: 15,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            widget,
            Text(
              subtitle,
              style: const TextStyle(fontSize: 13),
            ),
          ],
        ),
      ],
    );
  }

  Widget _listTile(
      String title, String subtitle, IconData icon, VoidCallback callback) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.black,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          fontSize: 13,
          color: Colors.black,
          height: 0,
        ),
      ),
      onTap: callback,
    );
  }
}
