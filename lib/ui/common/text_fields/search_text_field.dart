import 'package:flutter/material.dart';
import 'package:search_star_warriors/library/adaptive/adaptive.dart';
import 'package:search_star_warriors/ui/common/app_ink_well.dart';
import 'package:search_star_warriors/ui/common/text_fields/outline_text_field.dart';
import 'package:search_star_warriors/ui/resources/assets_path.dart';
import 'package:search_star_warriors/ui/theme/app_border_radius.dart';
import 'package:search_star_warriors/ui/theme/app_colors.dart';
import 'package:search_star_warriors/ui/theme/src/theme_extension.dart';

class SearchTextField extends StatelessWidget {
  /// Виджет поляя ввода поиска
  const SearchTextField({
    super.key,
    this.initialValue,
    this.hintText = '',
    this.onTap,
    this.controller,
    this.clearOnTap,
    this.isShowCloseButton,
    this.descriptionText,
  });

  /// Стартовое значение поля ввода
  final String? initialValue;

  /// Подсказка перед вводом
  final String hintText;

  /// Показать ли кнопку очистки
  final bool? isShowCloseButton;

  /// Коллбак на нажатие на полле ккода
  final VoidCallback? onTap;

  /// Коллбак очистки поля ввода
  final VoidCallback? clearOnTap;

  /// Контроллер
  final TextEditingController? controller;

  /// Текст описания назначения ввода
  final String? descriptionText;

  @override
  Widget build(BuildContext context) {
    return OutlineTextField(
      initialValue: initialValue,
      maxLines: 1,
      onTap: onTap,
      hintText: hintText,
      controller: controller,
      style: context.theme.textTheme.headlineLarge,
      descriptionText: descriptionText,
      textAlignVertical: TextAlignVertical.center,
      prefixIcon: Image.asset(AssetsPath.search),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppBorderRadius.radius10),
        borderSide: BorderSide(
          color: context.theme.dividerColor,
        ),
      ),
      suffixIcon: isShowCloseButton == true
          ? AppInkWell(
              splashColor: context.theme.transparent,
              onTap: clearOnTap ?? () {},
              child: Padding(
                padding: EdgeInsets.all(10.wA),
                child: Icon(
                  Icons.close,
                  color: context.theme.adaptiveColor(
                    AppColorsLight.black,
                    AppColorsDark.white,
                  ),
                ),
              ),
            )
          : const SizedBox.shrink(),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppBorderRadius.radius10),
        borderSide: BorderSide(
          color: context.theme.focusedBorderColor,
        ),
      ),
    );
  }
}

