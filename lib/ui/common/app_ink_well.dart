import 'package:flutter/material.dart';
import 'package:search_star_warriors/ui/theme/src/theme_extension.dart';

class AppInkWell extends StatelessWidget {

  /// Обработчик нажатий
  const AppInkWell({
    super.key,
    required this.child,
    required this.onTap,
    this.onLongPress,
    this.borderRadius,
    this.splashColor,
  });

  /// Дочерний виджет
  final Widget child;

  /// Корллбак на нажитие
  final VoidCallback onTap;

  /// Корллбак на долгое нажитие
  final VoidCallback? onLongPress;

  /// Радиус
  final BorderRadius? borderRadius;

  /// Цвет анимации нажатия
  final Color? splashColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.passthrough,
      alignment: Alignment.center,
      children: [
        child,
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onLongPress: onLongPress,
              splashColor: splashColor ?? context.theme.splashColor,
              highlightColor: splashColor ?? context.theme.splashColor,
              borderRadius: borderRadius,
              onTap: onTap,
            ),
          ),
        ),
      ],
    );
  }
}
