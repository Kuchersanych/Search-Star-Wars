import 'dart:async';
import 'package:flutter/material.dart';
import 'package:search_star_warriors/ui/theme/src/theme_extension.dart';
import 'package:search_star_warriors/util/extensions/context_extensions.dart';

part 'src/helper.dart';

part 'src/state.dart';

class Splash extends StatefulWidget {
  /// Заставка приложения.
  const Splash({
    super.key,
    required this.onEnd,
    this.durationSec = 4,
  });

  /// Действие по оканчанию анимации.
  final VoidCallback onEnd;

  /// Продолжительность анимаций.
  final int durationSec;

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SplashHelper.init();
    SplashHelper.controller = AnimationController(vsync: this, duration: const Duration(seconds: 3));
    SplashHelper.animation = Tween<double>(begin: 50, end: 25)
        .animate(CurvedAnimation(parent: SplashHelper.controller, curve: Curves.fastLinearToSlowEaseIn))
      ..addListener(() {
        SplashHelper._notifier.value = SplashHelper._notifier.value.copyWith(
          textOpacity: 1.0,
        );
      });

    SplashHelper.start(
      onEnd: widget.onEnd,
      duration: widget.durationSec,
    );
  }

  @override
  Widget build(BuildContext context) {
    final s = context.s;
    return Scaffold(
      body: SplashHelper.builder(builder: (state) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedOpacity(
                duration: Duration(seconds: (widget.durationSec / 4).floor()),
                opacity: state.textOpacity,
                child: Text(
                  s.searchStarWarriors,
                  style: context.textTheme.displayMedium?.copyWith(
                    fontSize: SplashHelper.animation.value,
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  @override
  void dispose() {
    SplashHelper.dispose();
    super.dispose();
  }
}
