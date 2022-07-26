import 'package:get/get.dart';

mixin FormValidator {
  bool isEmail(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }

  bool isName(String name) {
    return RegExp(r'^[a-zA-Z0-9]([_](?![_])|[a-zA-Z0-9]){1,18}[a-zA-Z0-9]$')
        .hasMatch(name);
  }

  String toGender(String gender) {
    switch (gender) {
      case 'MALE':
        return 'gender.male'.tr;
      case 'FEMALE':
        return 'gender.female'.tr;
      default:
        return 'gender.other'.tr;
    }
  }

  String toFaction(String faction) {
    switch (faction) {
      case 'PIRATE':
        return 'faction.pirate'.tr;
      case 'MARINE':
        return 'faction.marine'.tr;
      default:
        return 'faction.revolutionary'.tr;
    }
  }
}
