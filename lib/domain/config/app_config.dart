
import 'package:search_star_warriors/domain/config/debug_options.dart';

/// Конфигурация приложения.
class AppConfig {
  /// URL-адрес сервера.
  final String url;

  /// WebSocketUrl
  final String wsUrl;

  /// URL-адрес прокси.
  final String? proxyUrl;

  /// Дополнительные настройки приложения в режиме отладки.
  final DebugOptions debugOptions;

  /// Создаем экземпляр [AppConfig].
  AppConfig({
    required this.url,
    required this.wsUrl,
    required this.debugOptions,
    this.proxyUrl,
  });

  /// Создайте экземпляр [AppConfig] с измененными параметрами.
  AppConfig copyWith({
    String? url,
    String? wsUrl,
    String? proxyUrl,
    DebugOptions? debugOptions,
  }) =>
      AppConfig(
        url: url ?? this.url,
        wsUrl: wsUrl ?? this.wsUrl,
        proxyUrl: proxyUrl ?? this.proxyUrl,
        debugOptions: debugOptions ?? this.debugOptions,
      );
}
