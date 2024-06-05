part of '../adaptive.dart';

/// Расширения на [num]
extension DeviceExt on num {

  /// Соответствующее значение в пикселях
  double get px => toDouble();

  /// Размер наименьшей стороны экрана
  double get vmin => this * min(Device.height, Device.width) / 100;

  /// Размер наибольшей стороны экрана
  double get vmax => this * max(Device.height, Device.width) / 100;

  /// Вычисляет высоту в зависимости от размера экрана устройства
  ///
  /// Например: 20.h -> займет 20% высоты экрана
  double get hS => this * Device.height / 100;

  /// Вычисляет ширину в зависимости от размера экрана устройства
  ///
  /// Например: 20.h -> займет 20% ширины экрана
  double get wS => this * Device.width / 100;

  /// Адаптивная высота, относительно размеров Figma
  double get hA=> Device.height / Device.heightFigma * toDouble();

  /// Адаптивная ширина, относительно ширины размеров Figma
  double get wA => Device.width / Device.widthFigma * toDouble();

  /// Адаптация размера на меньшее из изменений сторон экрана устройства
  double get a => min(hA, wA);
}
