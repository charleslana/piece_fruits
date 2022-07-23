import 'package:flutter/material.dart';
import 'package:piece_fruits/src/services/pubspec_service.dart';

class AppVersion extends StatelessWidget {
  const AppVersion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Powered by Charles Games',
            style: TextStyle(
              fontSize: 13,
              color: Colors.white,
            ),
          ),
          FutureBuilder<String>(
            future: PubspecService().getVersion(),
            builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              return Text(
                'V. ${snapshot.data}',
                style: const TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
