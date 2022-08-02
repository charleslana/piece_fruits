import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:piece_fruits/src/components/rpg_awesome_icons.dart';
import 'package:piece_fruits/src/controllers/side_bar_controller.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: _showNavigation,
      elevation: 0,
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.menu),
          label: 'custom.bottom.navigation.menu'.tr,
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.email),
          label: '',
        ),
        const BottomNavigationBarItem(
          icon: Icon(RpgAwesome.vest),
          label: '',
        ),
        const BottomNavigationBarItem(
          icon: Icon(RpgAwesome.battered_axe),
          label: '',
        ),
        const BottomNavigationBarItem(
          icon: Icon(RpgAwesome.flaming_claw),
          label: '',
        ),
        const BottomNavigationBarItem(
          icon: Icon(RpgAwesome.crossed_swords),
          label: '',
        ),
      ],
    );
  }

  void _showNavigation(int index) {
    switch (index) {
      case 0:
        final SideBarController sideBarController =
            Get.find<SideBarController>();
        sideBarController.fetchDetailsCharacter();
        sideBarController.key.currentState!.openDrawer();
        break;
      case 1:
        print('correio');
        break;
      case 2:
        print('inventário');
        break;
      case 3:
        print('batalha npc');
        break;
      case 4:
        print('habilidades');
        break;
      default:
        print('arena');
    }
  }
}
