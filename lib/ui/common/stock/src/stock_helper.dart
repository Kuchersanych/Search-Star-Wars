part of '../stock_banner.dart';

/// Реализация работы логики [StockBanner]
class StockHelper {

  /// Получение рондомного числа
  int randomGen({
    required int min,
    required int max,
  }) {
    var x = Random().nextInt(max) + min;
    return x.floor();
  }

  /// Получение виджета согласно вероятности
  Widget getBanner(List<StockItem> items) {
    int random = randomGen(min: 0, max: items.length);

    for (var i = 0; i <= items.length; i++) {
      if (i == random) {
        return items[i].widget;
      }
    }

    late Widget defaultItem;
    try {
      defaultItem = items.firstWhere((e) => e.isDefault).widget;
    } catch (_) {
      defaultItem = const SizedBox.shrink();
    }

    return defaultItem;
  }
}