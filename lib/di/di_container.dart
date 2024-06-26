part of 'app_factory.dart';

/// Фабрика data

/// Хранимые свойства именуются в формате:
/// _get(получение)
/// +
/// Home(название возвращаемого класса)
/// +
/// VM, Service, Provider (назничение класса)
///
/// Example: _getHomeVM

/// Объявление методов(не хранимых свойств)
///
/// методы именуются в формате:
/// _make(сделать)
/// +
/// Home(название возвращаемого класса)
/// +
/// VM, Service, Provider (назничение класса)
///
/// Example: _makeHomeVM

class _DIContainer {
  static final _DIContainer _instance = _DIContainer._();
  late IMainService _mainService;
  late IStarWarriorsRepository _starWarriorsRepository;

  _DIContainer._() {
    _starWarriorsRepository = StarWarriorsRepository(hiveDB: _appScope.hiveDB);
    _mainService = MainService(
      dio: _appScope.dio,
      hiveDB: _appScope.hiveDB,
      starWarriorsRepository: _starWarriorsRepository,
    );
  }

  /// app
  AppVM _makeAppVM(BuildContext context) => AppVM(
        AppState(),
        context: context,
      );

  ///loading
  LoadingVM _makeLoadingVM(BuildContext context) => LoadingVM(context);

  /// dashboard
  DashboardVM _makeDashboardVM(BuildContext context) => DashboardVM(
        DashboardState(),
        context: context,
      );

  /// main
  MainVM _makeMainVM(BuildContext context) => MainVM(
        MainState(),
        context: context,
        mainService: _diContainer._mainService,
        starWarriorsRepository: _starWarriorsRepository,
      );

  ///favorites
  FavouritesVM _makeFavoritesVM(BuildContext context) => FavouritesVM(
        FavouritesVMState(),
        context: context,
        starWarriorsRepository: _starWarriorsRepository,
      );
}
