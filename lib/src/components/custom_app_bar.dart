import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:piece_fruits/src/controllers/language_controller.dart';
import 'package:piece_fruits/src/i18n/app_translation.dart';
import 'package:piece_fruits/src/models/language_model.dart';
import 'package:piece_fruits/src/utils/functions.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
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
      title: Text(title),
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
                    child: Text(
                      item.language,
                      style: const TextStyle(
                        color: Colors.white,
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
