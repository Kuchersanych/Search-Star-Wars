import 'package:flutter/material.dart';
import 'package:search_star_warriors/generated/l10n.dart';

/// Расширения [BuildContext]
extension ContextExtensions on BuildContext {

  /// Текущая локацизация приложения
  AppLocalizations get s => AppLocalizations.of(this);

  /// Закрытие клавиатуры
  void closeKeyboard() {
    FocusScope.of(this).unfocus();
  }

  /// Отключение фокуса клавиатуры
  void unfocus() {
    FocusScope.of(this).unfocus();
  }
}
