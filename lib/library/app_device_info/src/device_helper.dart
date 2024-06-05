part of '../app_device_info.dart';

/// Реализация логики работы []
abstract class DeviceHelper {
  /// Получение данных Android
  static DeviceInfo readAndroidDeviceInfo(AndroidDeviceInfo data) {
    return DeviceInfo(
      osVersion: data.version.release,
      device: data.device,
      brand: data.brand,
      model: data.model,
      serialNumber: data.serialNumber,
    );
  }

  /// Получение данных IOS
  static DeviceInfo readIosDeviceInfo(IosDeviceInfo data) {
    return DeviceInfo(
      osVersion: data.systemVersion,
      device: data.name,
      brand: data.systemName,
      model: data.model,
      serialNumber: data.identifierForVendor ?? '',
    );
  }
}
