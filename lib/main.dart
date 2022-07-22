import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:piece_fruits/src/constants/route_constant.dart';
import 'package:piece_fruits/src/constants/theme_constant.dart';
import 'package:piece_fruits/src/i18n/app_translation.dart';
import 'package:piece_fruits/src/services/language_service.dart';
import 'package:piece_fruits/src/services/route_service.dart';

Future<void> main() async {
  await GetStorage.init();
  // await SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.black,
    statusBarColor: Colors.black,
  ));
  await initializeDateFormatting();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Piece Fruits',
      translationsKeys: translationsKeys,
      locale: LanguageService().getLocale(),
      fallbackLocale: const Locale('en', 'US'),
      theme: theme,
      darkTheme: theme,
      initialRoute: splashScreenRoute,
      defaultTransition: Transition.fade,
      onGenerateRoute: RouteService().generateRoute,
    );
  }
}
