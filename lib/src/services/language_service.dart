import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:piece_fruits/src/services/get_storage_service.dart';

class LanguageService {
  final GetStorageService _getStorageService = GetStorageService();
  final String _key = 'language';

  void _saveLocale(String language) {
    _getStorageService.save(_key, language);
  }

  Locale _splitLanguage(String language) {
    final languageSplit = language.split('-');
    return Locale(languageSplit[0], languageSplit[1]);
  }

  void changeLocale(String language) {
    Get.updateLocale(_splitLanguage(language));
    _saveLocale(language);
  }

  Locale? getLocale() {
    final String? language = _getStorageService.read(_key);
    if (language == null) {
      return Get.deviceLocale;
    }
    return _splitLanguage(language);
  }

  String getStringLocale() {
    final String? language = _getStorageService.read(_key);
    if (language == null) {
      if (Get.deviceLocale == null) {
        return 'en-US';
      }
      return '${Get.deviceLocale!.languageCode}-${Get.deviceLocale!.countryCode}';
    }
    return language;
  }
}
