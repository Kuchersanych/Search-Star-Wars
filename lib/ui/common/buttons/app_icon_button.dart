import 'package:flutter/material.dart';
import 'package:search_star_warriors/ui/common/app_ink_well.dart';
import 'package:search_star_warriors/ui/theme/app_border_radius.dart';
import 'package:search_star_warriors/ui/theme/src/theme_extension.dart';

class AppIconButton extends StatelessWidget {
  /// Кнопка, с иконкой
  const AppIconButton({
    super.key,
    required this.icon,
    required this.onTap,
    this.width,
    this.height,
    this.innerPadding = 50,
    this.backgroundColor,
    this.iconSize = 25,
  });

  /// Иконка
  final IconData icon;

  /// Действие по нажатию
  final VoidCallback onTap;

  /// Ширина
  final double? width;

  /// Высота
  final double? height;

  /// Внутренний отступ
  final double innerPadding;

  /// Размер [icon]
  final double iconSize;

  /// Цвет кнопки
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return AppInkWell(
      borderRadius: BorderRadius.circular(AppBorderRadius.radius10),
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(innerPadding),
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppBorderRadius.radius10),
          color: backgroundColor ?? context.theme.appBarTheme.backgroundColor,
        ),
        child: Icon(
          icon,
          size: iconSize,
        ),
      ),
    );
  }
}
