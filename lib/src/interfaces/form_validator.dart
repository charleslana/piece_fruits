import 'package:get/get.dart';

mixin FormValidator {
  bool isEmail(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
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
}
