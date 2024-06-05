part of '../app_device_info.dart';

/// Информация о текущем устройстве
class DeviceInfo {
  /// Строка версии, видимая пользователю.
  final String osVersion;

  /// Название промышленного образца.
  final String device;

  /// Видимый потребителю бренд, с которым будет ассоциироваться продукт/оборудование, если таковое имеется.
  final String brand;

  /// Видимое конечному пользователю название конечного продукта.
  final String model;

  /// Уникальное значение UUID, идентифицирующее текущее устройство.
  final String serialNumber;

  DeviceInfo({
    required this.osVersion,
    required this.device,
    required this.brand,
    required this.model,
    required this.serialNumber,
  });

  factory DeviceInfo.zero() {
    return DeviceInfo(
      osVersion: '',
      device: '',
      brand: '',
      model: '',
      serialNumber: '',
    );
  }
}