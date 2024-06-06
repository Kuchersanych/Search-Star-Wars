part of 'app_factory.dart';

/// Область зависимостей, которые необходимы на протяжении всего жизненого цикла приложения.
class _AppScope implements IAppScope {
  late final Dio _dio;
  late final AppRouter _router;
  late final HiveDB _hiveDB;

  static final _AppScope _instance = _AppScope._();

  @override
  Dio get dio => _dio;

  @override
  AppRouter get router => _router;

  Iterable<Interceptor> get _additionalInterceptors => [];

  @override
  IHiveDB<TypeAdapter, dynamic> get hiveDB => _hiveDB;

  /// Создайте экземпляр [_AppScope].
  _AppScope._() {
    init();
  }

  /// Инициализация scope.
  Future<void> init() async {
    _initDio();
    _initRouter();
    _initHiveDB();
  }

  void _initDio() {
    const timeout = Duration(seconds: 30);

    final dio = Dio();
    // final config = Environment<AppConfig>.instance().config;

    dio.options
      ..baseUrl = 'https://swapi.dev/api/'
      ..connectTimeout = timeout
      ..receiveTimeout = timeout
      ..sendTimeout = timeout;

    final client = (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient?.call();
    if (client != null) {
      final proxyUrl = Url.baseUrl;

      client
        ..findProxy = (uri) {
          return 'PROXY $proxyUrl';
        }
        ..badCertificateCallback = (_, __, ___) {
          return true;
        };
    }

    dio.interceptors.addAll(_additionalInterceptors);

    _dio = dio;
  }

  void _initRouter() {
    _router = AppRouter.instance();

    /// Окончательные начальные маршруты = <PageRouteInfo<dynamic>>[].
    _router.delegate();
  }

  void _initHiveDB() {
    _hiveDB = HiveDB(adapterCount: 0, adapter: StarWarriorsAdapter(), tablesName: 'StarWarriors');
    _hiveDB.init();
  }
}
