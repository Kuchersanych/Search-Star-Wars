import 'package:search_star_warriors/domain/config/environment/build_types.dart';
import 'package:flutter/foundation.dart';

/// Конфигурация среды.
class Environment<T> implements Listenable {
  static Environment? _instance;
  final BuildType _currentBuildType;

  final _appTokens = const String.fromEnvironment('APP_TOKEN');
  final _signatures = const String.fromEnvironment('SIGNATURE');

  /// Конфигурация.
  T get config => _config.value;

  set config(T c) => _config.value = c;

  /// Это приложение работает в режиме отладки.
  bool get isDebug => _currentBuildType == BuildType.debug;

  /// Это приложение работает в режиме выпуска.
  bool get isRelease => _currentBuildType == BuildType.release;

  /// Токен приложения
  String get appTokens => _appTokens;

  /// Сигнатура
  String get signatures => _signatures;

  /// Тип сборки приложения.
  BuildType get buildType => _currentBuildType;

  ValueNotifier<T> _config;

  Environment._(
    this._currentBuildType,
    T config,
  ) : _config = ValueNotifier(config);

  /// Предоставляет экземпляр [Environment].
  factory Environment.instance() => _instance as Environment<T>;

  @override
  void addListener(VoidCallback listener) {
    _config.addListener(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    _config.removeListener(listener);
  }

  /// Инициализация среды.
  static void init<T>({
    required BuildType buildType,
    required T config,
  }) {
    _instance ??= Environment<T>._(
      buildType,
      config,
    );
  }
}
