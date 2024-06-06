
/// URL-адреса серверов.
abstract class Url {
  /// URL для разработки.
  static String get baseUrl => 'https://swapi.dev/api/';

}

/// URL-адреса запросов.
abstract class UrlRoutes {

  /// /// Получение списка найденных героев..
  static const searchWarriors = 'people?search=';
}

