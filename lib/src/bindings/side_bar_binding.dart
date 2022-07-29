import 'package:get/get.dart';
import 'package:piece_fruits/src/controllers/side_bar_controller.dart';

class SideBarBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SideBarController>(SideBarController.new);
  }
}
