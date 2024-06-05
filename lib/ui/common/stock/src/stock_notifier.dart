part of '../stock_banner.dart';

typedef StockBuilder = Widget Function(Widget child);

/// Item виджета
class StockItem {
  /// Виджет для отображения
  final Widget widget;

  /// Если не совпадет ни один [percentProbability],
  /// показывать ли текущий item как дефолтный
  final bool isDefault;

  StockItem({
    required this.widget,
    this.isDefault = false,
  });
}

/// Состояние [StockBanner]
class StockState {
  /// Банер, который необходимо показать пользователю
  final Widget? banner;

  /// Массив виджетов
  final List<StockItem> items;

  StockState({
    this.banner,
    this.items = const [],
  });

  StockState copyWith({
    Widget? banner,
    List<StockItem>? items,
  }) {
    return StockState(
      banner: banner ?? this.banner,
      items: items ?? this.items,
    );
  }
}

/// Управление состоянием [StockBanner]
class StockNotifier {
  /// Состояние [notifier]
  StockState _state = StockState();

  /// Реализация работы логики [StockBanner]
  final StockHelper helper = StockHelper();

  /// Массив виджетов
  final List<StockItem> items;

  /// Если  [durationSeconds] != null,
  /// то согдасно [durationSeconds] в секундах будет вызываться
  /// метод [randomGen]
  final int? durationSeconds;

  /// Старт без задержки
  final bool isStartWithoutDelay;

  /// Таймер
  Timer? _timer;

  StockNotifier({
    required this.items,
    required this.isStartWithoutDelay,
    this.durationSeconds,
  }) {
    _init();
  }

  /// Служит для реализации уведомления UI слоя об изминениях
  final notifier = ValueNotifier(StockState());

  /// Действие при инициализации [StockNotifier]
  void _init() {
    _state = _state.copyWith(items: items);

    if (durationSeconds != null) {

      if(isStartWithoutDelay) {
        _updateBanner();
      }

      _timer = Timer.periodic(
        Duration(seconds: durationSeconds!),
        (_) => _updateBanner(),
      );
    } else {
      _updateBanner();
    }
  }

  /// Получение и обновление [banner]
  void _updateBanner() {
    notifier.value = notifier.value.copyWith(
      banner: helper.getBanner(items),
    );
  }

  /// Вызывает [builder] при изминениии [_notifier]
  Widget builder({
    required StockBuilder builder,
  }) {
    return ValueListenableBuilder(
      valueListenable: notifier,
      builder: (context, state, child) {
        return Builder(builder: (_) {
          return builder(state.banner ?? const SizedBox.shrink());
        });
      },
    );
  }

  ///
  void dispose() {
    notifier.dispose();
    _timer?.cancel();
  }
}
