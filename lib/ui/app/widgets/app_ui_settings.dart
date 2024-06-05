import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:search_star_warriors/library/adaptive/adaptive.dart';
import 'package:search_star_warriors/ui/theme/app_theme.dart';
import 'package:search_star_warriors/library/status_bar_manager/status_bar_manager.dart';

import '../../theme/app_colors.dart';

typedef AppUIBuilder = Function(ThemeData, ThemeData);

class AppUISettings extends StatelessWidget {
  /// Настройка UI всего приложения
  const AppUISettings({
    super.key,
    required this.adaptiveState,
    required this.builder,
  });

  /// Состояние [Adaptive]
  final AdaptiveState adaptiveState;

  /// Дочерний виджет, обычно [MaterialApp] или [CupertinoApp]
  final AppUIBuilder builder;

  @override
  Widget build(BuildContext context) {
    return Adaptive(
      state: adaptiveState,
      builder: (context) {
        return AdaptiveTheme(
          light: AppTheme.light,
          dark: AppTheme.dark,
          initial: AppTheme.getResultThemeMode,
          builder: (ThemeData light, ThemeData dark) {
            final color = AppTheme.getResultThemeMode == AdaptiveThemeMode.light
                ? AppColorsLight.white
                : AppColorsDark.blackSky;

            return OverlaySupport.global(
              child: StatusBarManager(
                lightNavigationBarColor: color,
                theme: CurrentTheme.light,
                child: builder(light, dark),
              ),
            );
          },
        );
      },
    );
  }
}
