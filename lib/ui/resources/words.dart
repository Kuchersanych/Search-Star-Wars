import 'package:intl/intl.dart';

/// Получение строк с локализацией, без BuildContext
abstract class SWords {
  static final _locale = Intl.getCurrentLocale();
  static get example => Intl.message('example', name: 'example', locale: _locale);
}
