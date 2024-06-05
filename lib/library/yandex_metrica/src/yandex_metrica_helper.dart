part of '../yandex_metrica.dart';

/// Ключ для [AppMetrica]
const apiKey = '';

/// События [YandexMetrica]
abstract class YMEvents {
  /// Экраны
  static const verifyCode = 'Подтверждение СМС кода',
      authScreen = 'Авторизация';

  /// Действия с авторизацией
  static const auth = 'Авторизация пользователя',
      logout = 'Выход из аккаунта пользователя',
      deleteAccount = 'Удаление аккаунта пользователя',
      sendSMS = 'Запрос СМС кода';

  /// Действия с контактами компании
  static const call = 'Звонок в компанию по номеру:',
      vk = 'Переход в группу vk',
      whatsApp = 'Переход в группу whatsApp',
      telegram = 'Переход в группу telegram',
      instagram = 'Переход в группу instagram';
}

/// Предназначен для
abstract class YandexMetricaHelper {
  /// Подготовка данных для отправки
  /// события об успешном
  /// завершении оформления заказа
  /// TODO Реализовать до конца
  static Revenue revenueData({
    required String payment,
    required String deliveryType,
    required User user,
  }) {
    var buffer = StringBuffer();
    for (var i in []) {
      buffer.write(
        'Наименование: ${i.surName}, \nID: ${i.id}, \nСтоимость товара: ${i.price.result}, \nКоличество: ${i.basketCount}\n\n',
      );
    }

    final deliveryResult =
        deliveryType == 'addresses' ? 'Доставка по адресу' : 'Самовывоз';
    final payload =
        'Пользователь: user.name, \nСпособ получения: $deliveryResult \nСпособ оплаты: $payment}';

    return Revenue(
      Decimal.fromInt(100500),
      'RUB',
      payload: payload,
      productId: 'Tовары в заказе: \n\n${buffer.toString()}',
      quantity: 1,
    );
  }

  /// Подготовка данных для отправки события
  /// добавления товара в корзину
  static ECommerceCartItem addECommerceCartData(Product item) {
    const product = ECommerceProduct(
      sku: '',//item.id.toString(),
      name: '', //item.name,
    );

    final revenue = ECommercePrice(
      fiat: ECommerceAmount(
        amount: Decimal.fromInt(0), // item.price
        currency: 'RUB',
      ),
    );

    return ECommerceCartItem(
      product: product,
      quantity: Decimal.fromInt(1),
      revenue: revenue,
    );
  }

  /// Подготовка данных для отправки события
  /// удаления товара из корзины
  static ECommerceCartItem removeECommerceCartData(Product item) {
    const product = ECommerceProduct(
      sku: '',//item.id.toString(),
      name: '', //item.name,
    );

    final revenue = ECommercePrice(
      fiat: ECommerceAmount(
        amount: Decimal.fromInt(0), // item.price
        currency: 'RUB',
      ),
    );

    return ECommerceCartItem(
      product: product,
      quantity: Decimal.fromInt(1),
      revenue: revenue,
    );
  }

  /// Простотр детальной информации о товаре
  static ECommerceProduct showProductDetailsData(Product item) {
    return ECommerceProduct(
      sku: '',//item.id.toString(),
      name: '', //item.name,
      actualPrice: ECommercePrice(
        fiat: ECommerceAmount(
          amount: Decimal.fromInt(0), // item.price
          currency: 'RUB',
        ),
      ),
    );
  }

  /// Простотр экрана
  static ECommerceScreen showScreenData(String screenName,
      [String? description]) {
    final descriptionScreen = description ?? 'Переход на экран';
    return ECommerceScreen(name: '$descriptionScreen $screenName');
  }
}
