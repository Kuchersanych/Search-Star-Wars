part of 'app_factory.dart';

/// Фабрика виджетов

/// Каждый метод класса [WidgetFactory] именуется в формате:
/// homePage(название возвращаемого виджета в lowerCamelCase)
///
/// Example: homePage

abstract class WidgetFactory {

  /// Виджет баннеров акций
  static stockBanner() {
    return StockBanner(
      duration: 10,
      padding: EdgeInsets.symmetric(vertical: 10.a),
      items: [
        StockItem(widget: const BonusBanner()),
        StockItem(widget: const BonusBanner()),
        StockItem(widget: const BonusBanner()),
      ],
    );
  }
}