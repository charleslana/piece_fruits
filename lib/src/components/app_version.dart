import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

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
          FutureBuilder<PackageInfo>(
            future: _getPackageInfo(),
            builder:
                (BuildContext context, AsyncSnapshot<PackageInfo> snapshot) {
              if (snapshot.hasError) {
                return const Text('Error');
              }
              if (!snapshot.hasData) {
                return const Text('Loading...');
              }
              return Text(
                'V. ${snapshot.data!.version}',
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

  Future<PackageInfo> _getPackageInfo() {
    return PackageInfo.fromPlatform();
  }
}
