import 'package:get/get.dart';
import 'package:piece_fruits/src/constants/config_constant.dart';
import 'package:piece_fruits/src/models/login_model.dart';
import 'package:piece_fruits/src/services/get_storage_service.dart';
import 'package:piece_fruits/src/services/language_service.dart';
import 'package:piece_fruits/src/utils/functions.dart';

class LoginService extends GetConnect {
  final String _key = 'login';
  final GetStorageService _getStorageService = GetStorageService();
  final LanguageService _languageService = LanguageService();

  @override
  void onInit() {
    httpClient
      ..baseUrl = baseUrl
      ..defaultDecoder = LoginModel.decoderFromJson
      ..addRequestModifier<dynamic>((dynamic request) {
        request.headers['accept-language'] = _languageService.getStringLocale();
        return request;
      });
    super.onInit();
  }

  Map<String, dynamic>? getLogin() => _getStorageService.read(_key);

  String getToken() {
    final dynamic loginBox = _getStorageService.read(_key);
    if (loginBox is LoginModel) {
      return loginBox.accessToken ?? '';
    }
    final LoginModel login = LoginModel.decoderFromJson(loginBox);
    return login.accessToken ?? '';
  }

  Future<LoginModel> login(String email, String password) async {
    final formData = FormData({
      'email': email,
      'password': password,
    });
    final response = await post<dynamic>('/login', formData);
    if (response.status.hasError) {
      if (response.bodyString == null) {
        return Future.error(showConnectionFailure());
      }
      return Future.error(response.bodyString.toString());
    }
    return response.body;
  }

  void removeLogin() => _getStorageService.remove(_key);

  void saveLogin(LoginModel login) => _getStorageService.save(_key, login);
}
