import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:search_star_warriors/library/adaptive/adaptive.dart';
import 'package:flutter/material.dart';

import '../../resources/fonts_keys.dart';
import '../app_colors.dart';
import '../app_font_size.dart';
import '../app_theme.dart';

extension ThemeExtension on BuildContext {
  /// Получение текущей темы
  ThemeData get theme => Theme.of(this);

  /// Получение текстовых тем
  TextTheme get textTheme => theme.textTheme;

  /// Системный отступ сверху
  double get systemTopPadding =>
      MediaQuery
          .of(this)
          .padding
          .top;

  /// Системный отступ снизу
  double get systemBottomPadding =>
      MediaQuery
          .of(this)
          .padding
          .bottom;

  /// Настраиваемый стиль текста
  TextStyle? anyTextStyle({
    Color? color,
    double fontSize = AppFontSize.size14,
    FontWeight fontWeight = FontWeight.w400,
    double height = 1.0,
    double letterSpacing = 1.0,
    TextDecoration? decoration,
    String fontFamily = FontsKeys.natoMedium,
  }) {
    return theme.textTheme.titleSmall?.copyWith(
      fontFamily: fontFamily,
      fontSize: fontSize.a,
      fontWeight: fontWeight,
      color: color,
      height: height,
      decoration: decoration,
      letterSpacing: letterSpacing,
    );
  }

  /// Фигма H1 - Noto Sans size 24, w500, rgba (20, 24, 56, 1)
  TextStyle? white24w500({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? height,
  }) {
    return theme.textTheme.headlineLarge?.copyWith(
      fontSize: fontSize?.a,
      fontWeight: fontWeight,
      color: theme.adaptiveColor(AppColorsLight.white, AppColorsDark.white),
      height: height,
    );
  }

  TextStyle? blackWhite24w500({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return theme.textTheme.headlineLarge?.copyWith(
      fontSize: fontSize?.a,
      fontWeight: FontWeight.w500,
      color: theme.adaptiveColor(AppColorsLight.black, AppColorsDark.white),
    );
  }

  /// Фигма H1 - Noto Sans size 24, w500, rgba (17, 50, 127, 1)
  TextStyle? mBlue24({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return theme.textTheme.headlineMedium?.copyWith(
      fontSize: fontSize?.a,
      fontWeight: fontWeight,
      color: color,
    );
  }

  /// Фигма H1 - Noto Sans size 24, w500, rgba (145, 147, 167, 1)
  TextStyle? mGray24({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return theme.textTheme.headlineSmall?.copyWith(
      fontSize: fontSize?.a,
      fontWeight: fontWeight,
      color: color,
    );
  }

  /// ------- Фигма H2 - три варианта шрифта 18 размера, отличающиеся только цветом. ---------///

  /// Фигма H2 - Noto Sans size 18, w500, rgba (20, 24, 56, 1)
  TextStyle? mBlack18({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return theme.textTheme.headlineLarge?.copyWith(
      fontSize: fontSize?.a ?? 18.a,
      fontWeight: fontWeight,
      color: color,
    );
  }

  /// Фигма H2 - Noto Sans size 18, w500, rgba (17, 50, 127, 1)
  TextStyle? mBlue18({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return theme.textTheme.headlineMedium?.copyWith(
      fontSize: fontSize?.a ?? 18.a,
      fontWeight: fontWeight,
      color: color,
    );
  }

  /// Фигма H2 - Noto Sans size 18, w500, rgba (145, 147, 167, 1)
  TextStyle? mGray18({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return theme.textTheme.headlineSmall?.copyWith(
      fontSize: fontSize?.a ?? 18.a,
      fontWeight: fontWeight,
      color: color,
    );
  }

  /// ------- Фигма H3 - три варианта шрифта 16 размера, w600, отличающиеся только цветом. ---------///

  /// Фигма H3 - Noto Sans size 16, w600, rgba (20, 24, 56, 1)
  TextStyle? sbBlack16({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return theme.textTheme.headlineLarge?.copyWith(
      fontSize: fontSize?.a ?? 16.a,
      fontWeight: fontWeight ?? FontWeight.w600,
      color: color,
    );
  }

  /// Фигма H3 - Noto Sans size 16, w600, rgba (17, 50, 127, 1)
  TextStyle? sbBlue16({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return theme.textTheme.headlineMedium?.copyWith(
      fontSize: fontSize?.a ?? 16.a,
      fontWeight: fontWeight ?? FontWeight.w600,
      color: color,
    );
  }

  /// Фигма H3 - Noto Sans size 16, w600, rgba (145, 147, 167, 1)
  TextStyle? sbGray16({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return theme.textTheme.headlineSmall?.copyWith(
      fontSize: fontSize?.a ?? 16.a,
      fontWeight: fontWeight ?? FontWeight.w600,
      color: color,
    );
  }

  /// -------Фигма H4 - три варианта шрифта 16 размера, отличающиеся только цветом. ---------///

  /// Фигма H4 - Noto Sans size 16, w500, rgba (20, 24, 56, 1)
  TextStyle? mBlack16({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return theme.textTheme.headlineLarge?.copyWith(
      fontSize: fontSize?.a ?? 16.a,
      fontWeight: fontWeight,
      color: color,
    );
  }

  /// Фигма H4 - Noto Sans size 16, w500, rgba (17, 50, 127, 1)
  TextStyle? mBlue16({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return theme.textTheme.headlineMedium?.copyWith(
      fontSize: fontSize?.a ?? 16.a,
      fontWeight: fontWeight,
      color: color,
    );
  }

  /// Фигма H4 - Noto Sans size 16, w500, rgba (145, 147, 167, 1)
  TextStyle? mGray16({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return theme.textTheme.headlineSmall?.copyWith(
      fontSize: fontSize?.a ?? 16.a,
      fontWeight: fontWeight,
      color: color,
    );
  }

  /// ------- Фигма H5 -  три варианта шрифта 14 размера, w600, отличающиеся только цветом. ---------///

  /// Фигма H5 - Noto Sans size 14, w600, rgba (20, 24, 56, 1)
  TextStyle? sbBlack14({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return theme.textTheme.headlineLarge?.copyWith(
      fontSize: fontSize?.a ?? 14.a,
      fontWeight: fontWeight ?? FontWeight.w600,
      color: color,
    );
  }

  /// Фигма H5 - Noto Sans size 14, w600, rgba (17, 50, 127, 1)
  TextStyle? sbBlue14({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return theme.textTheme.headlineMedium?.copyWith(
      fontSize: fontSize?.a ?? 14.a,
      fontWeight: fontWeight ?? FontWeight.w600,
      color: color,
    );
  }

  /// Фигма H5 - Noto Sans size 14, w600, rgba (145, 147, 167, 1)
  TextStyle? sbGray14({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return theme.textTheme.headlineSmall?.copyWith(
      fontSize: fontSize?.a ?? 14.a,
      fontWeight: fontWeight ?? FontWeight.w600,
      color: color,
    );
  }

  /// -------Фигма H6 - три варианта шрифта 14 размера, w500, отличающиеся только цветом. ---------///

  /// Фигма H6 - Noto Sans size 14, w500, rgba (20, 24, 56, 1)
  TextStyle? mBlack14({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return theme.textTheme.headlineLarge?.copyWith(
      fontSize: fontSize?.a ?? 14.a,
      fontWeight: fontWeight,
      color: color,
    );
  }

  /// Фигма H6 - Noto Sans size 14, w500, rgba (17, 50, 127, 1)
  TextStyle? mBlue14({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return theme.textTheme.headlineMedium?.copyWith(
      fontSize: fontSize?.a ?? 14.a,
      fontWeight: fontWeight,
      color: color,
    );
  }

  /// Фигма H6 - Noto Sans size 14, w500, rgba (145, 147, 167, 1)
  TextStyle? mGray14({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return theme.textTheme.headlineSmall?.copyWith(
      fontSize: fontSize?.a ?? 14.a,
      fontWeight: fontWeight,
      color: color,
    );
  }

  /// -------Фигма Subtext - три варианта шрифта 12 размера, отличающиеся только цветом. ---------///

  /// Фигма Subtext - Noto Sans size 12, w500, rgba (20, 24, 56, 1)
  TextStyle? mBlack12({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return theme.textTheme.headlineLarge?.copyWith(
      fontSize: fontSize?.a ?? 12.a,
      fontWeight: fontWeight,
      color: color,
    );
  }

  /// Фигма Subtext - Noto Sans size 12, w500, rgba (17, 50, 127, 1)
  TextStyle? mBlue12({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return theme.textTheme.headlineMedium?.copyWith(
      fontSize: fontSize?.a ?? 12.a,
      fontWeight: fontWeight,
      color: color,
    );
  }

  /// Фигма Subtext - Noto Sans size 12, w500, rgba (145, 147, 167, 1)
  TextStyle? mGray12({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return theme.textTheme.headlineSmall?.copyWith(
      fontSize: fontSize?.a ?? 12.a,
      fontWeight: fontWeight,
      color: color,
    );
  }

  /// -------Фигма Text1 - три варианта шрифта 16 размера, отличающиеся только цветом. ---------///

  /// Фигма Text1 - Noto Sans size 16, w500, rgba (20, 24, 56, 1)
  TextStyle? mBlack16H({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return theme.textTheme.bodyLarge?.copyWith(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );
  }

  /// Фигма Text1 - Noto Sans size 16, w500, rgba (17, 50, 127, 1)
  TextStyle? mBlue16H({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: fontSize?.a,
      fontWeight: fontWeight,
      color: color,
    );
  }

  /// Фигма Text1 - Noto Sans size 16, w500, rgba (145, 147, 167, 1)
  TextStyle? mGray16H({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return theme.textTheme.bodySmall?.copyWith(
      fontSize: fontSize?.a,
      fontWeight: fontWeight,
      color: color,
    );
  }

  /// -------Фигма Text2 - три варианта шрифта 14 размера, w500, отличающиеся только цветом. ---------///

  /// Фигма Text2 - Noto Sans size 14, w500, rgba (20, 24, 56, 1)
  TextStyle? mBlack14H({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return theme.textTheme.bodyLarge?.copyWith(
      fontSize: fontSize?.a ?? 14.a,
      fontWeight: fontWeight,
      color: color,
    );
  }

  /// Фигма Text2 - Noto Sans size 14, w500, rgba (17, 50, 127, 1)
  TextStyle? mBlue14H({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: fontSize?.a ?? 14.a,
      fontWeight: fontWeight,
      color: color,
    );
  }

  /// Фигма Text2 - Noto Sans size 14, w500, rgba (145, 147, 167, 1)
  TextStyle? mGray14H({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return theme.textTheme.bodySmall?.copyWith(
      fontSize: fontSize?.a ?? 14.a,
      fontWeight: fontWeight,
      color: color,
    );
  }

  /// -------Фигма Text3 - три варианта шрифта 12 размера, отличающиеся только цветом. ---------///

  /// Фигма Text3 - Noto Sans size 12, w500, rgba (20, 24, 56, 1)
  TextStyle? mBlack12H({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return theme.textTheme.bodyLarge?.copyWith(
      fontSize: fontSize?.a ?? 12.a,
      fontWeight: fontWeight,
      color: color,
    );
  }

  /// Фигма Text3 - Noto Sans size 12, w500, rgba (17, 50, 127, 1)
  TextStyle? mBlue12H({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return theme.textTheme.bodyMedium?.copyWith(
      fontSize: fontSize?.a ?? 12.a,
      fontWeight: fontWeight,
      color: color,
    );
  }

  /// Фигма Text3 - Noto Sans size 12, w500, rgba (145, 147, 167, 1)
  TextStyle? mGray12H({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return theme.textTheme.bodySmall?.copyWith(
      fontSize: fontSize?.a ?? 12.a,
      fontWeight: fontWeight,
      color: color,
    );
  }

  /// -------Фигма Button - четыре варианта шрифта 14 размера, w600,  отличающиеся только цветом. ---------///

  /// Фигма Button - Noto Sans size 14, w600, rgba (20, 24, 56, 1)
  TextStyle? buttonStyleWhite({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return theme.textTheme.headlineLarge?.copyWith(
      fontSize: fontSize?.a ?? 14.a,
      fontWeight: fontWeight ?? FontWeight.w600,
      color: color ?? theme.cardColor,
      letterSpacing: 0.5,
    );
  }

  /// Фигма Button - Noto Sans size 14, w600, rgba (17, 50, 127, 1)
  TextStyle? buttonStyleBlue({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return theme.textTheme.headlineMedium?.copyWith(
      fontSize: fontSize?.a ?? 14.a,
      fontWeight: fontWeight ?? FontWeight.w600,
      color: color,
      letterSpacing: 0.5,
    );
  }

  /// Фигма Button - Noto Sans size 14, w600, rgba (20, 24, 56, 1)
  TextStyle? buttonStyleDarkBlue({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return theme.textTheme.headlineMedium?.copyWith(
      fontSize: fontSize?.a ?? 14.a,
      fontWeight: fontWeight ?? FontWeight.w600,
      color: AppColorsLight.deepPurpleBlue,
      letterSpacing: 0.5,
    );
  }

  /// Фигма Button - Noto Sans size 14, w600, rgba (145, 147, 167, 1)
  TextStyle? buttonStyleGray({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return theme.textTheme.headlineSmall?.copyWith(
      fontSize: fontSize?.a ?? 14.a,
      fontWeight: fontWeight ?? FontWeight.w600,
      color: color,
      letterSpacing: 0.5,
    );
  }

  /// -------Фигма Button - три варианта ПОДЧЕРКНУТОГО шрифта 14 размера, w500,  отличающиеся только цветом. ---------///

  /// Фигма Button - Подчеркнутый черный 14, w500, rgba (20, 24, 56, 1)
  TextStyle? linkBlack({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return theme.textTheme.headlineLarge?.copyWith(
      fontSize: fontSize?.a ?? 14.a,
      fontWeight: fontWeight,
      color: color,
      decoration: TextDecoration.underline,
    );
  }

  /// Фигма Button - Подчеркнутый синий 14, w500, rgba (17, 50, 127, 1)
  TextStyle? linkBlue({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return theme.textTheme.headlineMedium?.copyWith(
      fontSize: fontSize?.a ?? 14.a,
      fontWeight: fontWeight,
      color: color,
      decoration: TextDecoration.underline,
    );
  }

  /// Фигма Button - Подчеркнутый серый 14, w500, rgba (145, 147, 167, 1)
  TextStyle? linkGray({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return theme.textTheme.headlineSmall?.copyWith(
      fontSize: fontSize?.a ?? 14.a,
      fontWeight: fontWeight,
      color: color,
      decoration: TextDecoration.underline,
    );
  }
}

extension AppThemeData on ThemeData {

  /// Если isLightThemeMode == dark, вернет forDarkTheme : forLightTheme
  Color adaptiveColor(Color forLightTheme, Color forDarkTheme) {
    return isLightThemeMode ? forLightTheme : forDarkTheme;
  }

  /// Если value == true, вернет trueValueColor : falseValueColor
  Color? valueColor(bool value, Color? trueValueColor, Color? falseValueColor) {
    return value ? trueValueColor : falseValueColor;
  }

  /// Если светлая тема, вернет true
  bool get isLightThemeMode {
    return AppTheme.getResultThemeMode == AdaptiveThemeMode.light;
  }

  /// Цвет Border [Container]
  Color get containerBorderColor =>
      isLightThemeMode ? AppColorsLight.gray : AppColorsDark.grey1;

  /// Цвет [Container]
  Color get containerColor =>
      isLightThemeMode ? AppColorsLight.white : AppColorsDark.grey1;

  /// Цвет градиента
  List<Color> get gradient =>
      isLightThemeMode ? [AppColorsLight.orangeDawn, AppColorsLight.red, AppColorsLight.pink] : [
        AppColorsDark.white,
        AppColorsDark.blackSky
      ];

  /// Цвет Border-a: поля ввода, кнопки, фон
  Color get borderColor =>
      isLightThemeMode ? AppColorsLight.gray : AppColorsDark.grey1;

  /// Цвет активного Border-a: поля ввода, кнопки, фон
  Color get focusedBorderColor =>
      isLightThemeMode ? AppColorsLight.blue : AppColorsDark.blue;

  /// Цвет активного элемента (синий/ )
  Color get activeColor =>
      isLightThemeMode ? AppColorsLight.blackSea : AppColorsDark.grey1;

  /// Цвет неактивного элемента (серый/ )
  Color get inactiveColor =>
      isLightThemeMode ? AppColorsLight.manatee : AppColorsDark.grey1;

  /// Цвет фона [AppColorsLight.white]
  Color get backgroundWhiteColor =>
      isLightThemeMode ? AppColorsLight.white : AppColorsDark.grey1;

  /// Цвет фона [AppColorsLight.crayolaBlueLight]
  Color get backgroundCrayolaBlueColor =>
      isLightThemeMode ? AppColorsLight.crayolaBlueLight : AppColorsDark.grey1;

  /// Цвет неактивного заднего фона
  Color get backgroundInactiveColor =>
      isLightThemeMode ? AppColorsLight.crayolaBlue : AppColorsDark.grey1;

  /// Цвет overlay [AppColorsLight.crayolaBlueLight]
  Color get overlayBlueColor =>
      isLightThemeMode ? AppColorsLight.crayolaBlueLight : AppColorsDark.grey1;

  /// Цвет overlay [AppColorsLight.crayolaBlueLight]
  Color get overlayDarkBlueColor =>
      isLightThemeMode ? AppColorsLight.darkSplash : AppColorsDark.grey1;

  /// Цвет выбранного заднего фона
  Color get selectedBackgroundColor =>
      isLightThemeMode ? AppColorsLight.aqua : AppColorsDark.grey1;

  /// Цвет разделителя
  Color get dividerColor =>
      isLightThemeMode ? AppColorsLight.crayolaBlue : AppColorsDark.grey1;

  /// Цвет теней
  Color get shadowColor =>
      isLightThemeMode ? AppColorsLight.manatee : AppColorsDark.grey1;

  /// Цвет Навигационной панели
  Color get bottomNavigationBarColor => isLightThemeMode ? AppColorsLight.white : AppColorsDark.blackSky;

  /// Прозрачный.
  Color get transparent => Colors.transparent;
}


