import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:piece_fruits/src/controllers/side_bar_controller.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: _showNavigation,
      elevation: 0,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.menu),
          label: 'Menu',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.email),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            IconData(
              0xeae0,
              fontFamily: 'RpgAwesome',
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            IconData(
              0xe91c,
              fontFamily: 'RpgAwesome',
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            IconData(
              0xe9c9,
              fontFamily: 'RpgAwesome',
            ),
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            IconData(
              0xe97d,
              fontFamily: 'RpgAwesome',
            ),
          ),
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
