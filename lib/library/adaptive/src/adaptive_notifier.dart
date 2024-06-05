part of '../adaptive.dart';

typedef ANotifierBuilder = Widget Function(AdaptiveState state);

/// Служит для уведомления App об изминении [AppState]
late ValueNotifier<AdaptiveState> _notifier;

/// Состояние [AdaptiveNotifier.notifier]
class AdaptiveState {
  /// Высота экрана от которой будет производится адаптация
  final double height;

  /// Ширина экрана от которой будет производится адаптация
  final double width;

  /// Коофицент увилицения текстов
  final double scaleText;

  /// Состояние [AdaptiveNotifier.notifier]
  const AdaptiveState({
    this.height = 812,
    this.width = 375,
    this.scaleText = 1.0,
  });

  AdaptiveState copyWith({
    double? height,
    double? width,
    double? scaleText,
  }) {
    return AdaptiveState(
      height: height ?? this.height,
      width: width ?? this.width,
      scaleText: scaleText ?? this.scaleText,
    );
  }
}

/// Реализует функционал для уведомления об изминениях в [_notifier]
class AdaptiveNotifier {
  /// Обновление состояния [_notifier]
  static void update({
    double? height,
    double? width,
    double? scaleText,
  }) {
    _notifier.value = _notifier.value.copyWith(
      height: height,
      width: width,
      scaleText: scaleText,
    );
  }

  /// Добавление слушателя [_notifier]
  void listen(Function(AdaptiveState? state) callBack) {
    _notifier.addListener(() {
      callBack(_notifier.value);
    });
  }

  /// Вызывает [builder] при изминениии [_notifier]
  static Widget builder({
    required ANotifierBuilder builder,
  }) {
    return ValueListenableBuilder(
      valueListenable: _notifier,
      builder: (context, state, child) {
        return Builder(builder: (_) {
          return builder(state);
        });
      },
    );
  }

  ///
  void dispose() {
    _notifier.dispose();
  }
}
