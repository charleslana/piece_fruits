import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:piece_fruits/src/components/custom_app_bar.dart';
import 'package:piece_fruits/src/components/loading_overlay.dart';

class CreateAccountCharacterPage extends GetView<String> {
  const CreateAccountCharacterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: CustomAppBar(
          title: 'Criar personagem',
          isGoBack: true,
        ),
        body: LoadingOverlay(
          child: Center(
            child: Text('Create Character Page'),
          ),
        ),
      ),
    );
  }
}
