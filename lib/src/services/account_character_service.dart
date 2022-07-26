import 'package:get/get.dart';
import 'package:piece_fruits/src/constants/config_constant.dart';
import 'package:piece_fruits/src/models/account_character_model.dart';
import 'package:piece_fruits/src/models/create_account_character_model.dart';
import 'package:piece_fruits/src/models/response_model.dart';
import 'package:piece_fruits/src/models/update_account_character_model.dart';
import 'package:piece_fruits/src/services/language_service.dart';
import 'package:piece_fruits/src/services/login_service.dart';
import 'package:piece_fruits/src/utils/functions.dart';

class AccountCharacterService extends GetConnect {
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

  Future<ResponseModel> createAccountCharacter(
      CreateAccountCharacterModel createAccountCharacter) async {
    final response = await post<dynamic>(
        '/account/character', createAccountCharacter.toJson());
    if (response.status.hasError) {
      if (response.bodyString == null) {
        return Future.error(showConnectionFailure());
      }
      return Future.error(response.bodyString.toString());
    }
    return ResponseModel.decoderFromJson(response.body);
  }

  Future<ResponseModel> deleteAccountCharacter(int id) async {
    final response = await delete<dynamic>('/account/character/$id');
    if (response.status.hasError) {
      if (response.bodyString == null) {
        return Future.error(showConnectionFailure());
      }
      return Future.error(response.bodyString.toString());
    }
    return ResponseModel.decoderFromJson(response.body);
  }

  Future<List<AccountCharacterModel>> getAllAccountCharacters() async {
    final response = await get<dynamic>('/account/character/all');
    if (response.status.hasError) {
      if (response.bodyString == null) {
        return Future.error(showConnectionFailure());
      }
      return Future.error(response.bodyString.toString());
    }
    return AccountCharacterModel.listFromJson(response.body);
  }

  Future<AccountCharacterModel> getDetailsAccountCharacter() async {
    final response = await get<dynamic>('/account/character/details');
    if (response.status.hasError) {
      if (response.bodyString == null) {
        return Future.error(showConnectionFailure());
      }
      return Future.error(response.bodyString.toString());
    }
    return AccountCharacterModel.decoderFromJson(response.body);
  }

  Future<void> logoutAccountCharacter() async {
    final response = await post<dynamic>('/account/character/logout', null);
    if (response.status.hasError) {
      if (response.bodyString == null) {
        return Future.error(showConnectionFailure());
      }
      return Future.error(response.bodyString.toString());
    }
  }

  Future<void> selectAccountCharacter(int id) async {
    final response = await post<dynamic>('/account/character/$id', null);
    if (response.status.hasError) {
      if (response.bodyString == null) {
        return Future.error(showConnectionFailure());
      }
      return Future.error(response.bodyString.toString());
    }
  }

  Future<ResponseModel> updateAccountCharacter(
      UpdateAccountCharacterModel updateAccountCharacter) async {
    final response = await put<dynamic>(
        '/account/character', updateAccountCharacter.toJson());
    if (response.status.hasError) {
      if (response.bodyString == null) {
        return Future.error(showConnectionFailure());
      }
      return Future.error(response.bodyString.toString());
    }
    return ResponseModel.decoderFromJson(response.body);
  }
}
