import 'package:get/get.dart';
import 'package:piece_fruits/src/constants/config_constant.dart';
import 'package:piece_fruits/src/models/character_model.dart';
import 'package:piece_fruits/src/services/language_service.dart';
import 'package:piece_fruits/src/services/login_service.dart';
import 'package:piece_fruits/src/utils/functions.dart';

class CharacterService extends GetConnect {
  final LanguageService _languageService = LanguageService();
  final LoginService _loginService = LoginService();

  @override
  void onInit() {
    httpClient
      ..baseUrl = baseUrl
      ..addRequestModifier<dynamic>((dynamic request) {
        request.headers['accept-language'] = _languageService.getStringLocale();
        request.headers['Authorization'] = 'Bearer ${_loginService.getToken()}';
        request.headers['cookie'] = _loginService.getCookie();
        return request;
      });
    super.onInit();
  }

  Future<List<CharacterModel>> getAllCharacters() async {
    final response = await get<dynamic>('/character/initial');
    if (response.status.hasError) {
      if (response.bodyString == null) {
        return Future.error(showConnectionFailure());
      }
      return Future.error(response.bodyString.toString());
    }
    return CharacterModel.listFromJson(response.body);
  }
}
