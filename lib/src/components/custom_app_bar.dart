import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  }) : super(key: key);

  final String title;
  final bool isGoBack;
  final double offset;

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    final LanguageController languageController =
        Get.find<LanguageController>();

    return AppBar(
      leading: isGoBack
          ? const IconButton(
              onPressed: goBack,
              icon: Icon(Icons.arrow_back_ios_new),
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
                5,
              ),
            ),
          ],
          color: offset > 40 ? Colors.white : Colors.black,
        ),
      ),
      centerTitle: true,
      backgroundColor: offset > 40 ? Colors.black87 : Colors.transparent,
      elevation: 0,
      actions: [
        DropdownButtonHideUnderline(
          child: DropdownButton<LanguageModel>(
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
