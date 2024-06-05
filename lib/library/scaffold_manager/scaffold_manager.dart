library scaffold_manager_tg;

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:search_star_warriors/ui/common/app_progress_indicator.dart';
import 'package:search_star_warriors/ui/theme/src/theme_extension.dart';
part 'src/scaffold_manager_data.dart';

part 'src/scaffold_manager_helper.dart';

/// Базовый виджет экрана
class ScaffoldManager extends StatelessWidget {
  /// Статус загрузки экрана
  final ScaffoldManagerStatus status;

  /// [appBar]
  final PreferredSizeWidget? appBar;

  /// Виджет тела экрана
  final Widget body;

  /// Размеры [body]
  final BoxConstraints? constraints;

  /// backgroundColor [Scaffold]
  final Color? backgroundColor;

  /// Цвет [systemNavigationBarColor]
  final Color? systemNavigationBarColor;

  /// Цвет [statusBarColor]
  final Color? statusBarColor;

  /// Реагировать ли на открытие клавиатуры OS
  final bool? resizeToAvoidBottomInset;

  /// Навигационный бар
  final Widget? bottomNavigationBar;

  const ScaffoldManager({
    super.key,
    this.status = ScaffoldManagerStatus.loaded,
    this.appBar,
    required this.body,
    this.constraints,
    this.backgroundColor,
    this.systemNavigationBarColor,
    this.statusBarColor,
    this.resizeToAvoidBottomInset,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: (statusBarColor ?? backgroundColor) ?? context.theme.scaffoldBackgroundColor,
        systemNavigationBarColor: (systemNavigationBarColor ?? backgroundColor) ?? context.theme.scaffoldBackgroundColor,
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        backgroundColor: backgroundColor,
        appBar: appBar,
        body: Center(
          child: _ScaffoldManagerHelper._getChild(
            status,
            body,
          ),
        ),
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}
