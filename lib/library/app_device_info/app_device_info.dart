library app_device_info_tg;

/// Библиотека предназначена для реализации получения данных устройства
/// Зависит от device_info_plus: ^9.1.1

import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

part 'src/device_info.dart';
part 'src/device_helper.dart';

/// Информация о текущем устройстве
DeviceInfo? _deviceInfo;

abstract class AppDeviceInfo {
  /// Получение данных
 static Future<DeviceInfo> getData() async {
    try {
      if (Platform.isAndroid) {
        return _deviceInfo ??=
            DeviceHelper.readAndroidDeviceInfo(await DeviceInfoPlugin().androidInfo);
      } else {
        return _deviceInfo ??=
            DeviceHelper.readIosDeviceInfo(await DeviceInfoPlugin().iosInfo);
      }
    } catch (_) {
      return DeviceInfo.zero();
    }
  }
}
