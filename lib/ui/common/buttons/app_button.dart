import 'package:flutter/material.dart';
import 'package:search_star_warriors/library/adaptive/adaptive.dart';
import 'package:search_star_warriors/ui/common/app_ink_well.dart';
import 'package:search_star_warriors/ui/theme/app_border_radius.dart';
import 'package:search_star_warriors/ui/theme/app_font_size.dart';
import 'package:search_star_warriors/ui/theme/app_size.dart';
import 'package:search_star_warriors/ui/theme/src/theme_extension.dart';

class AppButton extends StatelessWidget {
  /// Виджет кнопки
  const AppButton({
    super.key,
    required this.text,
    required this.onTap,
    this.width,
    this.height,
    this.color,
  });

  /// Описание
  final String text;

  /// Действие по надатию
  final VoidCallback onTap;

  /// Ширина
  final double? width;

  /// Высота
  final double? height;

  /// Цвет кнопки.
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return AppInkWell(
      borderRadius: BorderRadius.circular(AppBorderRadius.radius10),
      onTap: onTap,
      child: Container(
        height: (height ?? AppSize.buttonHeight).a,
        width: width?.a ?? double.infinity,

        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(AppBorderRadius.radius10),
          border: Border.all(
            color: context.theme.scaffoldBackgroundColor,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: context.white24w500(fontSize: AppFontSize.size17),
        ),
      ),
    );
  }
}