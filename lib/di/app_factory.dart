import 'package:auto_route/auto_route.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:search_star_warriors/domain/entity/star_warrior.dart';
import 'package:search_star_warriors/domain/repositories/star_warriors_repository.dart';
import 'package:search_star_warriors/domain/services/main_service.dart';
import 'package:search_star_warriors/library/db/hive.dart';
import 'package:search_star_warriors/ui/app/app_vm.dart';
import 'package:search_star_warriors/ui/pages/dashboard/dashboard_page.dart';
import 'package:search_star_warriors/ui/pages/dashboard/dashboard_vm.dart';
import 'package:search_star_warriors/ui/pages/loading/loading_vm.dart';
import 'package:search_star_warriors/ui/pages/tabs/favourites/favorites_page.dart';
import 'package:search_star_warriors/ui/pages/tabs/favourites/favorites_vm.dart';
import 'package:search_star_warriors/ui/pages/tabs/main/main_vm.dart';
import 'package:search_star_warriors/ui/pages/tabs/main/main_page.dart';
import 'package:dio/dio.dart';
import 'package:search_star_warriors/ui/app/app.dart';
import 'package:flutter/material.dart';
import 'package:dio/io.dart';
import 'package:search_star_warriors/domain/config/app_config.dart';
import 'package:search_star_warriors/domain/config/environment/environment.dart';
import 'package:search_star_warriors/ui/pages/loading/loading_page.dart';

import '../ui/navigation/navigation.dart';

part 'app_scope.dart';

part 'screen_factory.dart';

part 'di_container.dart';

IAppFactory get makeAppFactory => _AppFactory();

final _diContainer = _DIContainer._instance;

late final IAppScope _appScope;

/// Зависимости приложения.
abstract interface class IAppScope {
  /// HTTP-клиент.
  Dio get dio;

  /// Навигация.
  AppRouter get router;

  /// Локльное хранилище
  IHiveDB get hiveDB;
}

abstract class IAppFactory {
  Widget makeApp();
}

class _AppFactory implements IAppFactory {
  _AppFactory() {
    _appScope = _AppScope._instance;
  }

  @override
  Widget makeApp() {
    return ChangeNotifierProvider(
      create: _diContainer._makeAppVM,
      child: App(
        config: _appScope.router.config(),
      ),
    );
  }
}
