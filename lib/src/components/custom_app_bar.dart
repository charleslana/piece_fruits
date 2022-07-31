import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:piece_fruits/src/constants/route_constant.dart';
import 'package:piece_fruits/src/controllers/language_controller.dart';
import 'package:piece_fruits/src/i18n/app_translation.dart';
import 'package:piece_fruits/src/models/language_model.dart';
import 'package:piece_fruits/src/utils/functions.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title = '',
    this.isGoBack = false,
    this.offset = 0,
    this.isHome = false,
    this.minOffset = 15,
  }) : super(key: key);

  final String title;
  final bool isGoBack;
  final double offset;
  final bool isHome;
  final double minOffset;

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    final LanguageController languageController =
        Get.find<LanguageController>();

    return AppBar(
      automaticallyImplyLeading: false,
      leading: isGoBack
          ? IconButton(
              onPressed: goBack,
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: offset > minOffset ? Colors.white : Colors.black,
              ),
            )
          : null,
      title: Text(
        title,
        style: TextStyle(
          shadows: const [
            Shadow(
              blurRadius: 10,
              color: Colors.white,
              offset: Offset(
                5,
                1,
              ),
            ),
          ],
          color: offset > minOffset ? Colors.white : Colors.black,
        ),
      ),
      centerTitle: true,
      backgroundColor: offset > minOffset ? Colors.black87 : Colors.transparent,
      elevation: 0,
      actions: [
        if (isHome) ...[
          IconButton(
            onPressed: () => navigate(overviewRoute),
            icon: Icon(
              Icons.home,
              color: offset > minOffset ? Colors.white : Colors.black,
            ),
          ),
          const SizedBox(width: 10),
        ],
        DropdownButtonHideUnderline(
          child: DropdownButton<LanguageModel>(
            iconEnabledColor: Colors.black,
            iconDisabledColor: Colors.black,
            value: languageController.selectedLanguage.value,
            items: languages
                .map(
                  (item) => DropdownMenuItem<LanguageModel>(
                    value: item,
                    child: SizedBox(
                      height: 30,
                      child: Image.asset(
                        languageController.languageIcon(item.language),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                )
                .toList(),
            onChanged: (LanguageModel? languageModel) =>
                languageController.changeLanguage(languageModel!),
          ),
        ),
      ],
    );
  }
}
