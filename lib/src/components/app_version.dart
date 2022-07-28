import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppVersion extends StatelessWidget {
  const AppVersion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Padding(
        padding: const EdgeInsets.all(2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Powered by Charles Games',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white,
                fontFamily: 'Lato',
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
                    fontSize: 12,
                    color: Colors.white,
                    fontFamily: 'Lato',
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<PackageInfo> _getPackageInfo() {
    return PackageInfo.fromPlatform();
  }
}
