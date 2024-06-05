
import 'package:search_star_warriors/domain/config/app_config.dart';
import 'package:search_star_warriors/domain/config/environment/environment.dart';

/// URL-адреса серверов.
abstract class Url {
  /// URL-адрес прокси-сервера.
  static String get prodProxyUrl => '';

  /// QA-адрес прокси-сервера.
  static String get qaProxyUrl => '';

  /// URL-адрес прокси-сервера разработки.
  static String get devProxyUrl => '';

  /// URL-адрес прокси-сервера продакшн.
  static String get prodWsUrl => '';

  /// URL-адрес Dev ws.
  static String get devWsUrl => '';

  /// Тестовый url.
  static String get testUrl => 'https://swapi.dev/api/';

  /// Продакшн url.
  static String get prodUrl => 'https://swapi.dev/api/';

  /// URL для разработки.
  static String get devUrl => 'https://swapi.dev/api/';

  /// Базовый url.
  static String get baseUrl => Environment<AppConfig>.instance().config.url;
}

/// URL-адреса запросов.
abstract class UrlRoutes {

  /// Получение перечня отделов.
  static const searchWarriors = 'people?search=';
}

