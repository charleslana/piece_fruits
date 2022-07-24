import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:piece_fruits/src/constants/route_constant.dart';
import 'package:piece_fruits/src/models/login_model.dart';
import 'package:piece_fruits/src/models/response_model.dart';
import 'package:piece_fruits/src/services/encrypt_service.dart';
import 'package:piece_fruits/src/services/landing_service.dart';
import 'package:piece_fruits/src/services/login_service.dart';
import 'package:piece_fruits/src/utils/functions.dart';

class LandingController extends GetxController {
  LandingController({
    required this.landingService,
    required this.loginService,
  });

  LandingService landingService = LandingService();
  LoginService loginService = LoginService();
  final EncryptService _encryptService = EncryptService();
  RxString text = 'landing.page.connection'.tr.obs;
  RxBool isLoading = true.obs;
  RxBool isFailure = false.obs;

  @override
  void onInit() {
    _fetchVersion();
    super.onInit();
  }

  Future<void> _fetchVersion() async {
    await landingService.getVersion().then(
      _validateConnection,
      onError: (dynamic error) {
        final ResponseModel responseModel = responseModelFromJson(error);
        isLoading.value = false;
        text.value = responseModel.message!;
        isFailure.value = true;
      },
    );
  }

  Future<void> _validateConnection(String result) async {
    final PackageInfo packageInfo = await PackageInfo.fromPlatform();
    if (result != packageInfo.version) {
      isLoading.value = false;
      text.value = 'landing.page.version'.tr;
      return;
    }
    text.value = 'landing.page.start'.tr;
    await _validateLoginBox();
  }

  Future<void> _validateLoginBox() async {
    final Map<String, dynamic>? loginBox = loginService.getLogin();
    if (loginBox == null) {
      navigateOff(loginRoute);
      return;
    }
    final LoginModel login = LoginModel.decoderFromJson(loginBox);
    if (login.email == null || login.password == null) {
      navigateOff(loginRoute);
      return;
    }
    await _validateLogin(login);
  }

  Future<void> _validateLogin(LoginModel login) async {
    final String password = _encryptService.decrypt(login.password!);
    await loginService.login(login.email!, password).then(
      (result) {
        result = result.copyWith(password: _encryptService.encrypt(password));
        loginService.saveLogin(result);
        navigateOff(accountCharacterRoute);
      },
      onError: (dynamic error) {
        navigateOff(loginRoute);
      },
    );
  }

  Future<void> tryConnect() async {
    isFailure.value = false;
    isLoading.value = true;
    text.value = 'landing.page.connection'.tr;
    await _fetchVersion();
  }
}
