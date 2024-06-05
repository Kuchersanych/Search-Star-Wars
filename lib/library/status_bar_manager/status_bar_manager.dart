library statusbarmanager_tg;

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'src/status_bar_manager_helper.dart';

part 'src/status_bar_manager_data.dart';

/// Менеджер управления нативными элементами устройства
class StatusBarManager extends StatelessWidget {
  /// Дочерний виджет
  final Widget child;

  /// Текущая тема
  final CurrentTheme theme;

  /// Сделать ли statusBar прозрачным
  final StatusBar? statusBar;

  /// Цвет statusBar
  final Color? statusBarColor;

  /// Настройка информационных иконок statusBar
  final Brightness? statusBarIconBrightness;

  /// Настройка типа statusBar
  final Brightness? statusBarBrightness;

  /// Цвет navigationBar для светлой темы
  final Color? lightNavigationBarColor;

  /// Цвет navigationBar для темной темы
  final Color? darkNavigationBarColor;

  /// Настройка типа navigationBar
  final Brightness? navigationBarBrightness;

  /// Цвет разделителя navigationBar
  final Color? navigationBarDividerColor;

  const StatusBarManager({
    Key? key,
    required this.child,
    required this.theme,
    this.statusBar,
    this.statusBarColor,
    this.statusBarIconBrightness,
    this.statusBarBrightness,
    this.lightNavigationBarColor,
    this.navigationBarBrightness,
    this.navigationBarDividerColor,
    this.darkNavigationBarColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = theme == CurrentTheme.dark;
    if (isDark) {
      StatusBarManagerHelper.setStatusBarStyle(
        theme : theme,
        statusBarIconBrightness: Brightness.light,
        statusBarColor: statusBarColor ?? Colors.transparent,
        statusBarBrightness: statusBarBrightness,
        systemNavigationBarColor: darkNavigationBarColor,
        systemNavigationBarIconBrightness: Brightness.light,
        systemNavigationBarDividerColor: navigationBarDividerColor,
      );
    } else {
      StatusBarManagerHelper.setStatusBarStyle(
        theme : theme,
        statusBarIconBrightness: Brightness.dark,
        statusBarColor: statusBarColor ?? Colors.transparent,
        statusBarBrightness: statusBarBrightness,
        systemNavigationBarColor: lightNavigationBarColor,
        systemNavigationBarIconBrightness: Brightness.dark,
        systemNavigationBarDividerColor: navigationBarDividerColor,
      );
    }

    return StatusBarManagerHelper.getChild(
      statusBar: statusBar,
      child: child,
      context: context,
    );
  }
}
