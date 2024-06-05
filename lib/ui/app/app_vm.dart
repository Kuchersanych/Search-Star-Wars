import 'package:flutter/material.dart';
import 'package:search_star_warriors/library/adaptive/adaptive.dart';
import 'package:search_star_warriors/util/vm_utils.dart';

/// Состояние [AppVM]
class AppState {
  /// Перечень локализация приложения
  final List<Locale> supportedLocales;

  /// Текущая локализация
  Locale? locale;

  /// Состояние [AdaptiveNotifier.notifier]
  final AdaptiveState adaptiveState;

  AppState({
    this.supportedLocales = const [
      Locale('ru', 'RU'),
      Locale('en', 'EN'),
      Locale('fr', 'FR'),
      Locale('du', 'DU'),
    ],
    this.adaptiveState = const AdaptiveState(),
    this.locale,
  });

  AppState copyWith({
    List<Locale>? supportedLocales,
    Locale? locale,
    AdaptiveState? adaptiveState,
  }) {
    return AppState(
      supportedLocales: supportedLocales ?? this.supportedLocales,
      locale: locale ?? this.locale,
      adaptiveState: adaptiveState ?? this.adaptiveState,
    );
  }
}

/// Управление состоянием [App]
class AppVM extends VMUtils<AppState> {
  final BuildContext context;

  AppVM(
    AppState state, {
    required this.context,
  }) : super(state);

  /// Изминение текущей локализации
  set locale(Locale locale) {
    notify(state.copyWith(locale: locale));
  }

  /// Установка локализации, согдасно локализации устройства
  void resetLocale() {
    state.locale = null;
    notify();
  }
}
