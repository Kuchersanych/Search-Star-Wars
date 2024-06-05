import 'dart:async';
import 'package:flutter/material.dart';
import 'package:search_star_warriors/library/adaptive/adaptive.dart';
import 'package:search_star_warriors/ui/resources/assets_path.dart';
import 'package:search_star_warriors/ui/theme/app_border_radius.dart';
import 'package:search_star_warriors/ui/theme/src/theme_extension.dart';

part 'src/helper.dart';

part 'src/state.dart';

class Splash extends StatefulWidget {
  const Splash({
    super.key,
    required this.onEnd,
    this.durationSec = 4,
  });

  /// Действие по оканчанию анимации
  final VoidCallback onEnd;

  /// Продолжительность анимаций
  final int durationSec;

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SplashHelper.init();
    SplashHelper.controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    SplashHelper.animation = Tween<double>(begin: 50, end: 25).animate(
        CurvedAnimation(
            parent: SplashHelper.controller,
            curve: Curves.fastLinearToSlowEaseIn))
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
    double width = 100.wS;
    double height = 100.hS;

    return Scaffold(
      body: SplashHelper.builder(builder: (state) {
        return Stack(
          children: [
            Column(
              children: [
                AnimatedContainer(
                  duration: Duration(seconds: (widget.durationSec / 2).floor()),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: height / state.fontSize,
                ),
                AnimatedOpacity(
                  duration: Duration(seconds: (widget.durationSec / 4).floor()),
                  opacity: state.textOpacity,
                  child: Text(
                    'Kuchersan Corporation',
                    style: context.textTheme.displayMedium?.copyWith(
                      fontSize: SplashHelper.animation.value,
                    ),
                  ),
                ),
              ],
            ),
            Center(
              child: AnimatedOpacity(
                duration: Duration(seconds: (widget.durationSec / 2).floor()),
                curve: Curves.fastLinearToSlowEaseIn,
                opacity: state.containerOpacity,
                child: AnimatedContainer(
                  duration: Duration(seconds: (widget.durationSec / 2).floor()),
                  curve: Curves.fastLinearToSlowEaseIn,
                  height: width / state.containerSize,
                  width: width / state.containerSize,
                  alignment: Alignment.center,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.circular(AppBorderRadius.radius15),
                  ),
                  child: Image.asset(AssetsPath.logo),
                ),
              ),
            ),
          ],
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
