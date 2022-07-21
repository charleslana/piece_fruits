import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:piece_fruits/src/controllers/loading_overlay_controller.dart';

class LoadingOverlay extends StatelessWidget {
  const LoadingOverlay({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final LoadingOverlayController loadingOverlayController =
        Get.find<LoadingOverlayController>();

    return Obx(() {
      return Stack(
        children: [
          child,
          if (loadingOverlayController.isLoading.value) ...[
            WillPopScope(
              onWillPop: () async => false,
              child: const Opacity(
                opacity: 0.2,
                child: ModalBarrier(
                  dismissible: false,
                  color: Colors.black,
                ),
              ),
            ),
            const Center(
              child: CircularProgressIndicator(),
            ),
          ]
        ],
      );
    });
  }
}
