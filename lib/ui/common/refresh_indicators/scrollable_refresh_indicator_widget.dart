import 'package:flutter/material.dart';
import 'package:search_star_warriors/ui/theme/src/theme_extension.dart';

/// Виджет рефреш индикатора с использованием ListView
class ScrollableRefreshIndicatorWidget extends StatelessWidget {
  /// Виджет рефреш индикатора с использованием ListView
  const ScrollableRefreshIndicatorWidget({
    required this.child,
    required this.onRefresh,
    super.key,
  });

  ///
  final Widget child;

  ///
  final Future<void> Function() onRefresh;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: context.theme.primaryColor,
      onRefresh: onRefresh,
      child: ListView(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          child,
        ],
      ),
    );
  }
}
