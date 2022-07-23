import 'package:get/get.dart';
import 'package:piece_fruits/src/constants/config_constant.dart';
import 'package:piece_fruits/src/utils/functions.dart';

class LandingService extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = baseUrl;
    super.onInit();
  }

  Future<String> getVersion() async {
    final response = await get<dynamic>('/version');
    if (response.status.hasError) {
      if (response.bodyString == null) {
        return Future.error(showConnectionFailure());
      }
      return Future.error(response.bodyString.toString());
    }
    return response.body;
  }
}
