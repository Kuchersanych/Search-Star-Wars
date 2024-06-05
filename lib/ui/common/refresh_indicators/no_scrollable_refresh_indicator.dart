import 'dart:async';
import 'package:flutter/material.dart';
import 'package:search_star_warriors/ui/theme/src/theme_extension.dart';

/// Виджет рефреш индикатора без использованием скроллов
class _ClampingScrollBehavior extends ScrollBehavior {
  @override
  ScrollPhysics getScrollPhysics(BuildContext context) => const ClampingScrollPhysics();
}

///
class NoScrollableRefreshIndicator extends StatelessWidget {

  ///
  const NoScrollableRefreshIndicator({
    required this.child,
    required this.onRefresh,
    super.key,
  });
  final Widget child;
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: ((_, constraints) {
        return SafeArea(
          child: RefreshIndicator(
            color: context.theme.primaryColor,
            backgroundColor: context.theme.dividerColor,
            onRefresh: onRefresh,
            child: ScrollConfiguration(
              behavior: _ClampingScrollBehavior(),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                      maxHeight: constraints.maxHeight
                  ),
                  child: child,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
