part of '../app_gradient_button.dart';

/// Состояние виджета [AppGradientButton]
class AppButtonData {
  /// Динамически меняющийся цвет левой части кнопки
  Color leftColor;

  /// Динамически меняющийся цвет правой части кнопки
  Color rightColor;

  /// Цвета градиента
  List<Color> colorList;

  ///
  int index;

  /// Старт анимации
  Alignment begin = Alignment.centerLeft;

  /// Окончание анимации
  Alignment end = Alignment.centerRight;

  AppButtonData({
    required this.rightColor,
    required this.leftColor,
    required this.index,
    required this.colorList,
  });

  AppButtonData copyWith({
    Color? leftColor,
    Color? rightColor,
    List<Color>? colorList,
    int? index,
    Alignment? begin,
    Alignment? end,
  }) {
    return AppButtonData(
      leftColor: leftColor ?? this.leftColor,
      rightColor: rightColor ?? this.rightColor,
      colorList: colorList ?? this.colorList,
      index: index ?? this.index,
    );
  }
}