import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:piece_fruits/src/bindings/language_binding.dart';
import 'package:piece_fruits/src/bindings/splashscreen_binding.dart';
import 'package:piece_fruits/src/constants/route_constant.dart';
import 'package:piece_fruits/src/pages/login_page.dart';
import 'package:piece_fruits/src/pages/splashscreen_page.dart';

class RouteService {
  GetPageRoute<dynamic> _getDefaultPage(RouteSettings settings) {
    return GetPageRoute(
      page: () => SafeArea(
        child: Scaffold(
          body: Center(
            child: Text('No path for ${settings.name}'),
          ),
        ),
      ),
    );
  }

  GetPageRoute<dynamic> _getLoginPage(RouteSettings settings) {
    return GetPageRoute(
      page: () => const LoginPage(),
      settings: settings,
      transition: Transition.rightToLeft,
      bindings: [
        LanguageBinding(),
      ],
    );
  }

  GetPageRoute<dynamic> _getSplashscreenPage(RouteSettings settings) {
    return GetPageRoute(
      page: () => const SplashscreenPage(),
      settings: settings,
      binding: SplashscreenBinding(),
    );
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashscreenRoute:
        return _getSplashscreenPage(settings);
      case loginRoute:
        return _getLoginPage(settings);
      default:
        return _getDefaultPage(settings);
    }
  }
}
