import 'package:get/get.dart';
import 'package:piece_fruits/src/controllers/loading_overlay_controller.dart';

class LoadingOverlayBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoadingOverlayController>(LoadingOverlayController.new);
  }
}
