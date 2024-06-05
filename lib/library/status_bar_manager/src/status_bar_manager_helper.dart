part of '../status_bar_manager.dart';

SystemUiOverlayStyle _overlayLight = const SystemUiOverlayStyle();
SystemUiOverlayStyle _overlayDark = const SystemUiOverlayStyle();

/// Реализация работы библиотеки
abstract class StatusBarManagerHelper {
  /// Установка настроек системных элементов
  static void setStatusBarStyle({
    CurrentTheme? theme,
    Brightness? statusBarBrightness,
    Brightness? systemNavigationBarIconBrightness,
    Brightness? statusBarIconBrightness,
    Color? statusBarColor,
    Color? systemNavigationBarColor,
    Color? systemNavigationBarDividerColor,
  }) {
    final isDark = theme == CurrentTheme.dark;

    if (Platform.isIOS) {
      SystemChrome.setSystemUIOverlayStyle(
        isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      );
    } else {
      if (isDark) {
        _overlayDark = _overlayDark.copyWith(
          statusBarBrightness: statusBarBrightness,
          systemNavigationBarIconBrightness: systemNavigationBarIconBrightness,
          statusBarIconBrightness: statusBarIconBrightness,
          statusBarColor: statusBarColor ?? Colors.transparent,
          systemNavigationBarColor: systemNavigationBarColor,
          systemNavigationBarDividerColor: systemNavigationBarDividerColor,
        );
        SystemChrome.setSystemUIOverlayStyle(_overlayDark);
      } else {
        _overlayLight = _overlayLight.copyWith(
          statusBarBrightness: statusBarBrightness,
          systemNavigationBarIconBrightness: systemNavigationBarIconBrightness,
          statusBarIconBrightness: statusBarIconBrightness,
          statusBarColor: statusBarColor ?? Colors.transparent,
          systemNavigationBarColor: systemNavigationBarColor,
          systemNavigationBarDividerColor: systemNavigationBarDividerColor,
        );
        SystemChrome.setSystemUIOverlayStyle(_overlayLight);
      }
    }
  }

  /// Управление системными элементами
  static void setEnabledSystemUIMode({
    required List<SystemUiOverlay> overlays,
    required SystemUiMode systemUiMode,
  }) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: overlays,
    );
  }

  /// Получение child
  static Widget getChild({
    required StatusBar? statusBar,
    required Widget child,
    required BuildContext context,
  }) {
    switch (statusBar) {
      case StatusBar.safeArea:
        return SafeArea(child: child);

      case StatusBar.systemPadding:
        return Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top,
            bottom: MediaQuery.of(context).padding.bottom,
          ),
          child: child,
        );

      default:
        return child;
    }
  }
}
