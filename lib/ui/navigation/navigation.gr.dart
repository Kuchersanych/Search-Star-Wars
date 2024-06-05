// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:search_star_warriors/di/app_factory.dart' as _i2;
import 'package:search_star_warriors/ui/navigation/empty_page/empty_page.dart'
    as _i1;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    EmptyRouter.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.EmptyRouterPage(),
      );
    },
    IDashboardRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.WrappedRoute(child: _i2.IDashboardPage()),
      );
    },
    IFavouritesRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.WrappedRoute(child: _i2.IFavouritesPage()),
      );
    },
    ILoadingRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.WrappedRoute(child: _i2.ILoadingPage()),
      );
    },
    IMainRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.WrappedRoute(child: _i2.IMainPage()),
      );
    },
    ISomethingWrongRoute.name: (routeData) {
      final args = routeData.argsAs<ISomethingWrongRouteArgs>();
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.WrappedRoute(child: _i2.ISomethingWrongPage(args.msg)),
      );
    },
  };
}

/// generated route for
/// [_i1.EmptyRouterPage]
class EmptyRouter extends _i3.PageRouteInfo<void> {
  const EmptyRouter({List<_i3.PageRouteInfo>? children})
      : super(
          EmptyRouter.name,
          initialChildren: children,
        );

  static const String name = 'EmptyRouter';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.IDashboardPage]
class IDashboardRoute extends _i3.PageRouteInfo<void> {
  const IDashboardRoute({List<_i3.PageRouteInfo>? children})
      : super(
          IDashboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'IDashboardRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.IFavouritesPage]
class IFavouritesRoute extends _i3.PageRouteInfo<void> {
  const IFavouritesRoute({List<_i3.PageRouteInfo>? children})
      : super(
          IFavouritesRoute.name,
          initialChildren: children,
        );

  static const String name = 'IFavouritesRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ILoadingPage]
class ILoadingRoute extends _i3.PageRouteInfo<void> {
  const ILoadingRoute({List<_i3.PageRouteInfo>? children})
      : super(
          ILoadingRoute.name,
          initialChildren: children,
        );

  static const String name = 'ILoadingRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.IMainPage]
class IMainRoute extends _i3.PageRouteInfo<void> {
  const IMainRoute({List<_i3.PageRouteInfo>? children})
      : super(
          IMainRoute.name,
          initialChildren: children,
        );

  static const String name = 'IMainRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ISomethingWrongPage]
class ISomethingWrongRoute extends _i3.PageRouteInfo<ISomethingWrongRouteArgs> {
  ISomethingWrongRoute({
    required String msg,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          ISomethingWrongRoute.name,
          args: ISomethingWrongRouteArgs(msg: msg),
          initialChildren: children,
        );

  static const String name = 'ISomethingWrongRoute';

  static const _i3.PageInfo<ISomethingWrongRouteArgs> page =
      _i3.PageInfo<ISomethingWrongRouteArgs>(name);
}

class ISomethingWrongRouteArgs {
  const ISomethingWrongRouteArgs({required this.msg});

  final String msg;

  @override
  String toString() {
    return 'ISomethingWrongRouteArgs{msg: $msg}';
  }
}
