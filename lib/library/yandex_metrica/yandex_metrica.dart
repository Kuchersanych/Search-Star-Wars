import 'package:appmetrica_plugin/appmetrica_plugin.dart';
import 'package:decimal/decimal.dart';
import 'package:appmetrica_plugin/src/ecommerce_event.dart';
import 'package:search_star_warriors/domain/entity/user.dart';

part 'src/yandex_metrica_helper.dart';

///
class YandexMetrica {
  final User user;

  YandexMetrica(this.user) {
    _init();
  }

  /// Действие при инициализации [YandexMetrica]
  void _init() {
    AppMetricaConfig config = const AppMetricaConfig(
      apiKey,
      logs: true,
      appVersion: '1.0.0',
      userProfileID: '0',
    );

    /// Активация [AppMetrica] с [config]
    AppMetrica.activate(config);

    /// Отправка местоположение пользователя
    AppMetrica.setLocationTracking(true);
  }

  /// Отправка события в [AppMetrica]
  static sendEvent(String event) async {
    try {
      await AppMetrica.reportEvent(event);
    } catch (e) {
      AppMetrica.reportError(
        message: 'Произошла ошибка: $e',
        errorDescription: AppMetricaErrorDescription.fromCurrentStackTrace(
            message: e.toString()),
      ).ignore();
    }
  }

  /// Отправка сообщения об успешном
  /// завершении оформления заказа
  Future<void> reportRevenue({
    required String payment,
    required String deliveryType,
  }) async {
    try {
      var revenue = YandexMetricaHelper.revenueData(
        payment: payment,
        deliveryType: deliveryType,
        user: user,
      );
      await AppMetrica.reportRevenue(revenue);
    } catch (e) {
      AppMetrica.reportError(
        message: 'Произошла ошибка: $e',
        errorDescription: AppMetricaErrorDescription.fromCurrentStackTrace(
            message: e.toString()),
      ).ignore();
    }
  }

  /// Добавление товара в корзину
  static Future<void> addCartItem(Product item) async {
    final event = YandexMetricaHelper.addECommerceCartData(item);
    await AppMetrica.reportECommerce(
        ECommerceConstructors.addCartItemEvent(event));
  }

  /// Удаление товара из корзины
  static Future<void> removeCartItem(Product item) async {
    final event = YandexMetricaHelper.removeECommerceCartData(item);
    await AppMetrica.reportECommerce(ECommerceConstructors.removeCartItemEvent(event));
  }

  /// Простотр экрана
  static Future<void> showScreen(String screenName, [String? description]) async {
    final screen = YandexMetricaHelper.showScreenData(screenName, description);
    await AppMetrica.reportECommerce(
      ECommerceConstructors.showScreenEvent(screen),
    );
  }

  /// Простотр детальной информации о товаре
  static Future<void> showProductDetails(Product item) async {
    final product = YandexMetricaHelper.showProductDetailsData(item);
    await AppMetrica.reportECommerce(
      ECommerceConstructors.showProductDetailsEvent(product, null),
    );
  }
}
class Product {}
