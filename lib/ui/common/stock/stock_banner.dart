import 'dart:async';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:search_star_warriors/library/adaptive/adaptive.dart';
import 'package:search_star_warriors/ui/common/banners/banner_card.dart';
import 'package:search_star_warriors/ui/common/buttons/app_button.dart';
import 'package:search_star_warriors/ui/theme/app_durations.dart';
import 'package:search_star_warriors/ui/theme/src/theme_extension.dart';
import 'package:search_star_warriors/util/extensions/context_extensions.dart';

part '../banners/bonus_banner.dart';

part 'src/stock_notifier.dart';

part 'src/stock_helper.dart';

class StockBanner extends StatefulWidget {
  /// Виджет рекламного банера
  const StockBanner({
    super.key,
    required this.items,
    this.padding,
    this.duration,
    this.isStartWithoutDelay = true,
  });

  /// Массив виджетов
  final List<StockItem> items;

  /// Если  [durationSeconds] != null,
  /// то согдасно [durationSeconds] в секундах будет вызываться
  /// метод [randomGen]
  final int? duration;

  /// Отступ
  final EdgeInsets? padding;

  /// Старт без задержки
  final bool isStartWithoutDelay;

  @override
  State<StockBanner> createState() => _StockBannerState();
}

class _StockBannerState extends State<StockBanner> {
  /// Управление состоянием [StockBanner]
  late StockNotifier notifier;

  @override
  void initState() {
    notifier = StockNotifier(
      isStartWithoutDelay: widget.isStartWithoutDelay,
      items: widget.items,
      durationSeconds: widget.duration,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<AnimatorWidgetState> basicAnimation =
        GlobalKey<AnimatorWidgetState>();

    return notifier.builder(
      builder: (state) {
        basicAnimation.currentState?.forward();
        return Padding(
          padding: widget.padding ?? EdgeInsets.zero,
          child: BounceIn(
            key: basicAnimation,
            preferences: const AnimationPreferences(
              magnitude: 0.1,
              autoPlay: AnimationPlayStates.Forward,
            ),
            child: state,
          ),
        );
      },
    );
  }
}
