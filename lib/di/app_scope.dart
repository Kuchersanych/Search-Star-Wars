part of 'app_factory.dart';

/// Область зависимостей, которые необходимы на протяжении всего жизненого цикла приложения.
class _AppScope implements IAppScope {
  late final Dio _dio;
  late final AppRouter _router;

  static final _AppScope _instance = _AppScope._();

  @override
  Dio get dio => _dio;

  @override
  AppRouter get router => _router;

  Iterable<Interceptor> get _additionalInterceptors => [];


  /// Создайте экземпляр [_AppScope].
  _AppScope._() {
    init();
  }

  /// Инициализация scope.
  Future<void> init() async {
    _initDio();
    _initRouter();
  }

  void _initDio() {
    const timeout = Duration(seconds: 30);

    final dio = Dio();
    final config = Environment<AppConfig>.instance().config;

    dio.options
      ..baseUrl = config.url
      ..connectTimeout = timeout
      ..receiveTimeout = timeout
      ..sendTimeout = timeout;

    final client =
        (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient?.call();
    if (client != null) {
      final proxyUrl = config.proxyUrl;
      if (proxyUrl != null && proxyUrl.isNotEmpty) {
        client
          ..findProxy = (uri) {
            return 'PROXY $proxyUrl';
          }
          ..badCertificateCallback = (_, __, ___) {
            return true;
          };
      }
    }

    dio.interceptors.addAll(_additionalInterceptors);

    if (Environment<AppConfig>.instance().isDebug) {
      dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));
    }
    _dio = dio;
  }

  void _initRouter() {
    _router = AppRouter.instance();

    /// Окончательные начальные маршруты = <PageRouteInfo<dynamic>>[].
    _router.delegate();
  }

  @override
  IAppSharedPreferences get sharedPreferences => AppSharedPreferences();

  @override
  IAppSecureStorage get secureStorage => AppSecureStorage(const FlutterSecureStorage());
}
