import 'package:get/get.dart';
import 'package:piece_fruits/src/constants/image_constant.dart';
import 'package:piece_fruits/src/i18n/app_translation.dart';
import 'package:piece_fruits/src/models/language_model.dart';
import 'package:piece_fruits/src/services/language_service.dart';

class LanguageController extends GetxController {
  final Rxn<LanguageModel> selectedLanguage = Rxn<LanguageModel>();
  final LanguageService languageService = LanguageService();

  @override
  void onInit() {
    selectedLanguage.value = languages
        .where((language) =>
            language.language == languageService.getStringLocale())
        .toList()
        .first;
    super.onInit();
  }

  void changeLanguage(LanguageModel languageModel) {
    if (languageModel.locale != selectedLanguage.value!.locale) {
      selectedLanguage.value = languageModel;
      languageService.changeLocale(languageModel.language);
    }
  }

  String languageIcon(String language) {
    switch (language) {
      case 'en-US':
        return enIcon;
      case 'pt-BR':
        return ptIcon;
      default:
        return esIcon;
    }
  }
}
