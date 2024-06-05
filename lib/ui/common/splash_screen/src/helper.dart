part of '../splash.dart';

typedef _SplashNotifierBuilder = Widget Function(SplashState state);

/// Реализация работы [Splash]
class SplashHelper {
  static late ValueNotifier<SplashState> _notifier;
  static late AnimationController controller;
  static late Animation<double> animation;

  /// Действие при и нициализации [SplashHelper]
  static void init() {
    _notifier = ValueNotifier(SplashState());
  }

  /// Запуск анимации
  static void start({
    required VoidCallback onEnd,
    required int duration,
  }) {
    controller.forward();
    Timer(
      Duration(seconds: (duration / 2).floor()),
      () {
        _notifier.value = _notifier.value.copyWith(
          fontSize: 1.5,
          containerSize: 2,
          containerOpacity: 1,
        );
      },
    );

    Timer(Duration(seconds: duration), onEnd);
  }

  /// Вызывает [builder] при изминениии [_notifier]
  static Widget builder({
    // ignore: library_private_types_in_public_api
    required _SplashNotifierBuilder builder,
  }) {
    return ValueListenableBuilder(
      valueListenable: _notifier,
      builder: (context, state, child) {
        return builder(state);
      },
    );
  }

  static void dispose() {
    controller.dispose();
  }
}
