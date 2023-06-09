import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class DeviceInfo {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

  static Future<String?> getDeviceId() async {
    try {
      if (kIsWeb) {
        WebBrowserInfo webInfo = await deviceInfoPlugin.webBrowserInfo;
        print('Web');
        return webInfo.browserName.name;
      } else {
        if (defaultTargetPlatform == TargetPlatform.android) {
          AndroidDeviceInfo androidInfo = await deviceInfoPlugin.androidInfo;
          return androidInfo.id;
        } else if (defaultTargetPlatform == TargetPlatform.iOS) {
          IosDeviceInfo iosInfo = await deviceInfoPlugin.iosInfo;
          return iosInfo.identifierForVendor;
        }
      }
    } on PlatformException {
      return 'not found deviceId';
    }

    return null;
  }
}
