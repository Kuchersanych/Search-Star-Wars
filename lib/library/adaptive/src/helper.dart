part of '../adaptive.dart';

/// Тип операционной системы устройства
enum OSType { android, ios, windows, mac, fuchsia, linux }

/// Тип экрана
///
/// Это может быть мобильный телефон или планшет
enum ScreenType { mobile, tablet, desktop }

class Device {
  static late BoxConstraints boxConstraints;

  /// Ориентация
  static late Orientation orientation;

  /// Тип устройства
  static late OSType deviceType;

  /// Тип экрана
  static late ScreenType screenType;

  /// Высота экрана устройства
  static late double height;

  /// Ширина экрана устройства
  static late double width;

  /// Соотношение сторон экрана устройства
  static late double aspectRatio;

  /// Соотношение сторон экрана устройства в пикселях
  static late double pixelRatio;

  /// Высота экрана от которой будет производится адаптация
  static late double heightFigma;

  /// Ширина экрана от которой будет производится адаптация
  static late double widthFigma;

  /// Устанавливает размер экрана и `Ориентацию` устройства,
  /// `BoxConstraints`, `Height` и `Width`
  static void setScreenSize(
    BuildContext context,
    BoxConstraints constraints,
    Orientation currentOrientation,
    heightFromFigma,
    widthFromFigma,
  ) {
    // Устанавливает ограничения и ориентацию бокса
    boxConstraints = constraints;
    orientation = currentOrientation;

    // Устанавливает ширину и высоту экрана
    width = boxConstraints.maxWidth;
    height = boxConstraints.maxHeight;

    // Устанавливает формат и соотношение в пикселях
    aspectRatio = constraints.constrainDimensions(width, height).aspectRatio;
    pixelRatio = View.of(context).devicePixelRatio;

    // Установка значение для размера экрана по Figma
    heightFigma = heightFromFigma;
    widthFigma = widthFromFigma;

    // Установка типа стройства
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        deviceType = OSType.android;
        break;
      case TargetPlatform.iOS:
        deviceType = OSType.ios;
        break;
      case TargetPlatform.windows:
        deviceType = OSType.windows;
        break;
      case TargetPlatform.macOS:
        deviceType = OSType.mac;
        break;
      case TargetPlatform.fuchsia:
        deviceType = OSType.fuchsia;
        break;
      case TargetPlatform.linux:
        deviceType = OSType.linux;
        break;
    }
  }
}
