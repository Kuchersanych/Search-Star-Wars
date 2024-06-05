import 'package:flutter/material.dart';

/// Цвета светлой темы приложения

abstract class AppColorsLight {
  const AppColorsLight._();

  /// Синий (0, 66, 125)
  static const blue = Color.fromRGBO(0, 66, 125, 1);
  /// Черный (28, 28, 28, 1.0)
  static const black = Color.fromRGBO(35, 35, 38, 1);

  /// Белый (255, 255, 255, 1)
  static const white = Color.fromRGBO(255, 255, 255, 1);

  /// Белый (247, 247, 250, 1)
  static const white2 = Color.fromRGBO(247, 247, 250, 1);

  /// Серый (130, 130, 130, 1)
  static const gray = Color.fromRGBO(154, 153, 162, 1);

  /// Розовый (255, 45, 85, 1)
  static const pink = Color.fromRGBO(255, 45, 85, 1);

  /// Красный (255, 59, 48, 1)
  static const red = Color.fromRGBO(255, 59, 48, 1);

  /// Оранжевый (255, 149, 0, 1)
  static const orange = Color.fromRGBO(255, 149, 0, 1);

  /// Зелёный (255, 149, 0, 1)
  static const green = Color.fromRGBO(52, 199, 89, 1);

  /// Бирюзовый (90, 200, 250, 1)
  static const teal = Color.fromRGBO(90, 200, 250, 1);

  /// Бирюзовый2 (130, 197, 230, 1)
  static const teal2 = Color.fromRGBO(130, 197, 230, 1);

  /// Индиго (88, 86, 214, 1)
  static const indigo = Color.fromRGBO(88, 86, 214, 1);

  /// ---------------------------Не использующиеся---------------------------

  /// Прозрачный
  static const transparent = Colors.transparent;

  /// 9, 36, 99, 1
  static const darkSplash = Color.fromRGBO(9, 36, 99, 1);

  /// Черный (20, 24, 56, 1)
  static const deepPurpleBlue = Color.fromRGBO(20, 24, 56, 1);

  /// Серый (145, 147, 167, 1)
  static const manatee = Color.fromRGBO(145, 147, 167, 1);

  /// Фон 217, 219, 228, 1
  static const paleBlue = Color.fromRGBO(217, 219, 228, 1);

  /// 235, 236, 242, 1
  static const crayolaBlue = Color.fromRGBO(235, 236, 242, 1);

  /// 244, 245, 249, 1
  static const crayolaBlueLight = Color.fromRGBO(244, 245, 249, 1);

  /// 246, 246, 246, 1
  static const gray1 = Color.fromRGBO(246, 246, 246, 1);

  /// акцентные оттенки

  /// 0, 147, 255, 1
  static const aqua = Color.fromRGBO(0, 147, 255, 1);

  /// Синий (17, 50, 127, 1)
  static const blackSea = Color.fromRGBO(17, 50, 127, 1);

  /// 26, 194, 97, 1
  static const crayolaGreen = Color.fromRGBO(26, 194, 97, 1);

  /// 255, 96, 96, 1
  static const orangeDawn = Color.fromRGBO(255, 96, 96, 1);

  /// 255, 138, 0, 1
  static const darkOrange = Color.fromRGBO(255, 138, 0, 1);

  /// gradient colors

  /// 27, 49, 235, 1
  static const denimBlue = Color.fromRGBO(27, 49, 235, 1);

  /// 197, 85, 231, 1
  static const orchid = Color.fromRGBO(197, 85, 231, 1);

  /// 238, 170, 138, 1
  static const salmon = Color.fromRGBO(238, 170, 138, 1);

  /// 241, 128, 104, 1
  static const siennaFire = Color.fromRGBO(241, 128, 104, 1);
}

/// Цвета темной темы
abstract class AppColorsDark {
  /// Черный(0, 0, 0, 1)
  static const black = Color.fromRGBO(0, 0, 0, 1);

  /// Черный(35, 35, 38, 0.72)
  static const blackSky = Color.fromRGBO(35, 35, 38, 0.72);

  /// Зеленый (52, 199, 89, 1)
  static const green = Color.fromRGBO(52, 199, 89, 1);

  /// Серый (130, 130, 130, 1)
  static const gray = Color.fromRGBO(154, 153, 162, 1);

  /// Синий (0, 66, 125)
  static const blue = Color.fromRGBO(0, 66, 125, 1);

  /// ---------------------------Не использующиеся---------------------------
  ///
  static const white = Color.fromRGBO(255, 255, 255, 1);

  ///
  static const grey1 = Color.fromRGBO(130, 130, 130, 1);

  ///
  static const grey7 = Color.fromRGBO(241, 241, 249, 1);

  ///
  static const yellow = Color.fromRGBO(255, 163, 0, 1);
}
