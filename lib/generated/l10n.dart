// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(_current != null,
        'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      AppLocalizations._current = instance;

      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `Файлы`
  String get files {
    return Intl.message(
      'Файлы',
      name: 'files',
      desc: '',
      args: [],
    );
  }

  /// `Сканер`
  String get scanner {
    return Intl.message(
      'Сканер',
      name: 'scanner',
      desc: '',
      args: [],
    );
  }

  /// `Настройки`
  String get settings {
    return Intl.message(
      'Настройки',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Профиль`
  String get profile {
    return Intl.message(
      'Профиль',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Главная`
  String get main {
    return Intl.message(
      'Главная',
      name: 'main',
      desc: '',
      args: [],
    );
  }

  /// `Недавние файлы`
  String get recentFiles {
    return Intl.message(
      'Недавние файлы',
      name: 'recentFiles',
      desc: '',
      args: [],
    );
  }

  /// `Избранное`
  String get favorites {
    return Intl.message(
      'Избранное',
      name: 'favorites',
      desc: '',
      args: [],
    );
  }

  /// `Найти фильм`
  String get searchFilm {
    return Intl.message(
      'Найти фильм',
      name: 'searchFilm',
      desc: '',
      args: [],
    );
  }

  /// `Здесь появятся Ваши файлы, с которыми Вы работали в последнее время`
  String get recentlyYourFiles {
    return Intl.message(
      'Здесь появятся Ваши файлы, с которыми Вы работали в последнее время',
      name: 'recentlyYourFiles',
      desc: '',
      args: [],
    );
  }

  /// `Здесь появятся Ваши избранные файлы`
  String get favoriteYourFiles {
    return Intl.message(
      'Здесь появятся Ваши избранные файлы',
      name: 'favoriteYourFiles',
      desc: '',
      args: [],
    );
  }

  /// `Получите баллы, просмотрев рекламный ролик!`
  String get pointsWatchingVideo {
    return Intl.message(
      'Получите баллы, просмотрев рекламный ролик!',
      name: 'pointsWatchingVideo',
      desc: '',
      args: [],
    );
  }

  /// `Смотреть`
  String get watch {
    return Intl.message(
      'Смотреть',
      name: 'watch',
      desc: '',
      args: [],
    );
  }

  /// `Поиск`
  String get search {
    return Intl.message(
      'Поиск',
      name: 'search',
      desc: '',
      args: [],
    );
  }

  /// `Избранное`
  String get favourites {
    return Intl.message(
      'Избранное',
      name: 'favourites',
      desc: '',
      args: [],
    );
  }

  /// `Сериалы`
  String get serials {
    return Intl.message(
      'Сериалы',
      name: 'serials',
      desc: '',
      args: [],
    );
  }

  /// `У Вас нет сохраненных фильмов`
  String get donFilms {
    return Intl.message(
      'У Вас нет сохраненных фильмов',
      name: 'donFilms',
      desc: '',
      args: [],
    );
  }

  /// `Начните вводить имя героя`
  String get typingHeroName {
    return Intl.message(
      'Начните вводить имя героя',
      name: 'typingHeroName',
      desc: '',
      args: [],
    );
  }

  /// `Изменить фото`
  String get changePhoto {
    return Intl.message(
      'Изменить фото',
      name: 'changePhoto',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'ru'),
      Locale.fromSubtags(languageCode: 'du'),
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'fr'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
