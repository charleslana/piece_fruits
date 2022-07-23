import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:piece_fruits/src/bindings/character_binding.dart';
import 'package:piece_fruits/src/bindings/landing_binding.dart';
import 'package:piece_fruits/src/bindings/language_binding.dart';
import 'package:piece_fruits/src/bindings/loading_overlay_binding.dart';
import 'package:piece_fruits/src/bindings/login_binding.dart';
import 'package:piece_fruits/src/bindings/register_binding.dart';
import 'package:piece_fruits/src/bindings/splash_screen_binding.dart';
import 'package:piece_fruits/src/constants/route_constant.dart';
import 'package:piece_fruits/src/pages/character_page.dart';
import 'package:piece_fruits/src/pages/landing_page.dart';
import 'package:piece_fruits/src/pages/login_page.dart';
import 'package:piece_fruits/src/pages/register_page.dart';
import 'package:piece_fruits/src/pages/splash_screen_page.dart';

class RouteService {
  GetPageRoute<dynamic> _getCharacterPage(RouteSettings settings) {
    return GetPageRoute(
      page: () => const CharacterPage(),
      settings: settings,
      transition: Transition.leftToRight,
      bindings: [
        LanguageBinding(),
        LoadingOverlayBinding(),
        CharacterBinding(),
      ],
    );
  }

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

  GetPageRoute<dynamic> _getLandingPage(RouteSettings settings) {
    return GetPageRoute(
      page: () => const LandingPage(),
      settings: settings,
      transition: Transition.rightToLeft,
      bindings: [
        LanguageBinding(),
        LandingBinding(),
      ],
    );
  }

  GetPageRoute<dynamic> _getLoginPage(RouteSettings settings) {
    return GetPageRoute(
      page: () => const LoginPage(),
      settings: settings,
      transition: Transition.rightToLeft,
      bindings: [
        LanguageBinding(),
        LoadingOverlayBinding(),
        LoginBinding(),
      ],
    );
  }

  GetPageRoute<dynamic> _getRegisterPage(RouteSettings settings) {
    return GetPageRoute(
      page: () => const RegisterPage(),
      settings: settings,
      transition: Transition.rightToLeft,
      bindings: [
        LanguageBinding(),
        LoadingOverlayBinding(),
        RegisterBinding(),
      ],
    );
  }

  GetPageRoute<dynamic> _getSplashScreenPage(RouteSettings settings) {
    return GetPageRoute(
      page: () => const SplashScreenPage(),
      settings: settings,
      binding: SplashScreenBinding(),
    );
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashScreenRoute:
        return _getSplashScreenPage(settings);
      case landingRoute:
        return _getLandingPage(settings);
      case loginRoute:
        return _getLoginPage(settings);
      case registerRoute:
        return _getRegisterPage(settings);
      case charactersRoute:
        return _getCharacterPage(settings);
      default:
        return _getDefaultPage(settings);
    }
  }
}
