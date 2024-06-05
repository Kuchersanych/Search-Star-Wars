import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:search_star_warriors/library/adaptive/adaptive.dart';
import 'package:search_star_warriors/library/status_bar_manager/status_bar_manager.dart';
import 'package:search_star_warriors/ui/resources/fonts_keys.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_font_size.dart';

abstract class AppTheme {
  static AdaptiveThemeMode getResultThemeMode = AdaptiveThemeMode.light;

  static Future<void> updateSavedThemeMode() async {
    await AdaptiveTheme.getThemeMode().then(
        (value) => getResultThemeMode = (value ?? AdaptiveThemeMode.light));
  }

  static void changeTheme({
    required BuildContext context,
    required AdaptiveThemeMode theme,
  }) async {
    switch (theme) {
      case AdaptiveThemeMode.light:
        AdaptiveTheme.of(context).setLight();
        break;
      case AdaptiveThemeMode.dark:
        AdaptiveTheme.of(context).setDark();
        break;
      case AdaptiveThemeMode.system:
        if (getResultThemeMode == AdaptiveThemeMode.system) return;
        AdaptiveTheme.of(context).setSystem();
        break;
    }
    await updateSavedThemeMode()
        .whenComplete(() => StatusBarManagerHelper.setStatusBarStyle(
              theme: getResultThemeMode == AdaptiveThemeMode.light
                  ? CurrentTheme.light
                  : CurrentTheme.dark,
            ));
  }

  /// Настройки светлой темы приложения.
  static final light = ThemeData(
    iconTheme: const IconThemeData(
      color: AppColorsLight.blue,
    ),

    /// Настройка кнопки в светлой теме.
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(AppColorsLight.white),
        backgroundColor: MaterialStateProperty.all(AppColorsLight.gray),
        overlayColor: MaterialStateProperty.all(
          AppColorsLight.orangeDawn.withOpacity(0.3),
        ),
      ),
    ),

    /// Цвета светлой темы.
    scaffoldBackgroundColor: AppColorsLight.white2,
    primaryColor: AppColorsLight.white,
    splashFactory: InkRipple.splashFactory,
    splashColor: AppColorsLight.blue.withOpacity(0.3),
    indicatorColor: AppColorsLight.orangeDawn,
    disabledColor: AppColorsLight.gray,
    secondaryHeaderColor: AppColorsLight.gray,
    dividerColor: AppColorsLight.gray,
    hintColor: AppColorsLight.blackSea,
    cardColor: AppColorsLight.white,
    textTheme: _lightTextTheme,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: AppFontSize.size17,
        fontFamily: FontsKeys.natoMedium,
        color: AppColorsLight.blackSea,
        fontWeight: FontWeight.w700,
      ),
      foregroundColor: AppColorsLight.blackSea,
      backgroundColor: AppColorsLight.white2,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 10,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColorsLight.white,
        selectedItemColor: AppColorsLight.orange,
        unselectedItemColor: AppColorsLight.gray,
        selectedLabelStyle: TextStyle(
          fontSize: AppFontSize.size12,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: AppFontSize.size12,
          fontWeight: FontWeight.w500,
        )),
    tabBarTheme: TabBarTheme(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      indicatorColor: AppColorsLight.orange,
      labelColor: AppColorsLight.orange,
      unselectedLabelColor: AppColorsLight.gray,
      unselectedLabelStyle: const TextStyle(
        fontSize: AppFontSize.size12,
        fontWeight: FontWeight.w500,
      ),
      labelStyle: const TextStyle(
        fontSize: AppFontSize.size12,
        fontWeight: FontWeight.w500,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: AppColorsLight.gray),
      ),
    ),
  );

  /// Настройки темной темы приложения.
  static final dark = ThemeData(
    iconTheme: const IconThemeData(
      color: AppColorsDark.white,
    ),

    /// Настройка кнопки в темной теме.
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all(AppColorsDark.white),
        backgroundColor: MaterialStateProperty.all(AppColorsDark.grey1),
        overlayColor: MaterialStateProperty.all(
          AppColorsLight.orangeDawn.withOpacity(0.3),
        ),
      ),
    ),

    /// Цвета темной темы.
    scaffoldBackgroundColor: AppColorsDark.blackSky,
    primaryColor: AppColorsDark.blackSky,
    splashFactory: InkRipple.splashFactory,
    splashColor: AppColorsDark.yellow.withOpacity(0.3),
    indicatorColor: AppColorsLight.orangeDawn,
    disabledColor: AppColorsDark.grey1,
    secondaryHeaderColor: AppColorsDark.grey1,
    dividerColor: AppColorsDark.grey1,
    hintColor: AppColorsDark.white,
    cardColor: AppColorsDark.blackSky,
    textTheme: _darkTextTheme,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: AppFontSize.size17,
        fontFamily: FontsKeys.natoMedium,
        color: AppColorsLight.blackSea,
        fontWeight: FontWeight.w700,
      ),
      foregroundColor: AppColorsLight.blackSea,
      backgroundColor: AppColorsLight.white2,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        elevation: 10,
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColorsDark.white,
        selectedItemColor: AppColorsDark.green,
        unselectedItemColor: AppColorsDark.gray,
        selectedLabelStyle: TextStyle(
          fontSize: AppFontSize.size10,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: AppFontSize.size10,
          fontWeight: FontWeight.w500,
        )),
    tabBarTheme: TabBarTheme(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      indicatorColor: AppColorsDark.green,
      labelColor: AppColorsDark.green,
      unselectedLabelColor: AppColorsDark.gray,
      unselectedLabelStyle: const TextStyle(
        fontSize: AppFontSize.size12,
        fontWeight: FontWeight.w500,
      ),
      labelStyle: const TextStyle(
        fontSize: AppFontSize.size12,
        fontWeight: FontWeight.w500,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColorsDark.blackSky)),
    ),
  );

  /// ---------------Настройки шрифтов светлой темы--------------///
  static final _lightTextTheme = TextTheme(
    /// Следующие 6 шрифтов переопределяются в [ContextExtensions],
    /// Просьба без веской причины не редактировать!
    ///
    /// Заголовок черный, используется в H1- H6, Subtext)
    headlineLarge: TextStyle(
      fontSize: 24.a,
      fontFamily: FontsKeys.natoMedium,
      color: AppColorsLight.deepPurpleBlue,
      fontWeight: FontWeight.w500,
    ),

    /// Заголовок синий, используется в H1- H6, Subtext)
    headlineMedium: TextStyle(
      fontSize: 24.a,
      fontFamily: FontsKeys.natoMedium,
      color: AppColorsLight.blue,
      fontWeight: FontWeight.w500,
    ),

    /// Заголовок серый, используется в H1- H6, Subtext)
    headlineSmall: TextStyle(
      fontSize: 24.a,
      fontFamily: FontsKeys.natoMedium,
      color: AppColorsLight.manatee,
      fontWeight: FontWeight.w500,
    ),

    /// Черный текст, используется в Text1, Text2, Text3
    bodyLarge: TextStyle(
      fontSize: 16.a,
      fontFamily: FontsKeys.natoMedium,
      color: AppColorsLight.deepPurpleBlue,
      fontWeight: FontWeight.w500,
      height: 1.5,
    ),

    /// Синий текст, используется в Text1, Text2, Text3
    bodyMedium: TextStyle(
      fontSize: 16.a,
      fontFamily: FontsKeys.natoMedium,
      color: AppColorsLight.blackSea,
      fontWeight: FontWeight.w500,
      height: 1.5,
    ),

    /// Серый текст, используется в Text1, Text2, Text3
    bodySmall: TextStyle(
      fontSize: 16.a,
      fontFamily: FontsKeys.natoMedium,
      color: AppColorsLight.manatee,
      fontWeight: FontWeight.w500,
      height: 1.5,
    ),

    /// Большое название
    titleLarge: TextStyle(
      fontSize: 16.a,
      fontFamily: FontsKeys.natoMedium,
      color: AppColorsLight.blackSea,
      fontWeight: FontWeight.w600,
    ),

    /// Среднее название (Используется системно по умолчанию  в текстФилде!)
    titleMedium: TextStyle(
      fontSize: 16.a,
      fontFamily: FontsKeys.natoMedium,
      color: AppColorsLight.deepPurpleBlue,
      fontWeight: FontWeight.w500,
    ),

    /// Маленькое название
    titleSmall: TextStyle(
      fontSize: 14.a,
      fontFamily: FontsKeys.natoMedium,
      color: AppColorsLight.deepPurpleBlue,
      fontWeight: FontWeight.w500,
    ),

    labelSmall: TextStyle(
      fontSize: 16.a,
      fontFamily: FontsKeys.natoMedium,
      color: AppColorsLight.manatee,
      fontWeight: FontWeight.w500,
      height: 1,
    ),
    labelMedium: TextStyle(
      fontSize: 16.a,
      fontFamily: FontsKeys.natoMedium,
      color: Colors.orange, // AppColorsLight.deepPurpleBlue,
      fontWeight: FontWeight.w500,
    ),
    labelLarge: TextStyle(
      fontSize: 16.a,
      fontFamily: FontsKeys.natoMedium,
      color: Colors.orange, //AppColorsLight.deepPurpleBlue,
      fontWeight: FontWeight.w500,
    ),
  );

  /// ---------------Настройки шрифтов светлой темы--------------///
  static final _darkTextTheme = TextTheme(
    /// Следующие 6 шрифтов переопределяются в [ContextExtensions],
    /// Просьба без веской причины не редактировать!
    ///
    /// Заголовок черный, используется в H1- H6, Subtext)
    headlineLarge: TextStyle(
      fontSize: 24.a,
      fontFamily: FontsKeys.natoMedium,
      color: AppColorsLight.deepPurpleBlue,
      fontWeight: FontWeight.w500,
    ),

    /// Заголовок синий, используется в H1- H6, Subtext)
    headlineMedium: TextStyle(
      fontSize: 24.a,
      fontFamily: FontsKeys.natoMedium,
      color: AppColorsLight.blue,
      fontWeight: FontWeight.w500,
    ),

    /// Заголовок серый, используется в H1- H6, Subtext)
    headlineSmall: TextStyle(
      fontSize: 24.a,
      fontFamily: FontsKeys.natoMedium,
      color: AppColorsLight.manatee,
      fontWeight: FontWeight.w500,
    ),

    /// Черный текст, используется в Text1, Text2, Text3
    bodyLarge: TextStyle(
      fontSize: 16.a,
      fontFamily: FontsKeys.natoMedium,
      color: AppColorsLight.deepPurpleBlue,
      fontWeight: FontWeight.w500,
      height: 1.5,
    ),

    /// Синий текст, используется в Text1, Text2, Text3
    bodyMedium: TextStyle(
      fontSize: 16.a,
      fontFamily: FontsKeys.natoMedium,
      color: AppColorsLight.blackSea,
      fontWeight: FontWeight.w500,
      height: 1.5,
    ),

    /// Серый текст, используется в Text1, Text2, Text3
    bodySmall: TextStyle(
      fontSize: 16.a,
      fontFamily: FontsKeys.natoMedium,
      color: AppColorsLight.manatee,
      fontWeight: FontWeight.w500,
      height: 1.5,
    ),

    /// Большое название
    titleLarge: TextStyle(
      fontSize: 16.a,
      fontFamily: FontsKeys.natoMedium,
      color: AppColorsLight.blackSea,
      fontWeight: FontWeight.w600,
    ),

    /// Среднее название (Используется системно по умолчанию  в текстФилде!)
    titleMedium: TextStyle(
      fontSize: 16.a,
      fontFamily: FontsKeys.natoMedium,
      color: AppColorsLight.deepPurpleBlue,
      fontWeight: FontWeight.w500,
    ),

    /// Маленькое название
    titleSmall: TextStyle(
      fontSize: 14.a,
      fontFamily: FontsKeys.natoMedium,
      color: AppColorsLight.deepPurpleBlue,
      fontWeight: FontWeight.w500,
    ),

    labelSmall: TextStyle(
      fontSize: 16.a,
      fontFamily: FontsKeys.natoMedium,
      color: AppColorsLight.manatee,
      fontWeight: FontWeight.w500,
      height: 1,
    ),
    labelMedium: TextStyle(
      fontSize: 16.a,
      fontFamily: FontsKeys.natoMedium,
      color: Colors.orange, // AppColorsLight.deepPurpleBlue,
      fontWeight: FontWeight.w500,
    ),
    labelLarge: TextStyle(
      fontSize: 16.a,
      fontFamily: FontsKeys.natoMedium,
      color: Colors.orange, //AppColorsLight.deepPurpleBlue,
      fontWeight: FontWeight.w500,
    ),
  );
}
