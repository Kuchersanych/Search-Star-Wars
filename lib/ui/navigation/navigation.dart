import 'package:auto_route/auto_route.dart';
import 'package:search_star_warriors/ui/navigation/navigation.gr.dart';

import 'routes/app_routes.dart';

@AutoRouterConfig()
class AppRouter extends $AppRouter {
  static final AppRouter _router = AppRouter._();
  static const _duration = 500;

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          path: AppRootRoutes.empty.path,
          page: AppRootRoutes.empty.page,
          children: [
            CustomRoute(
              initial: true,
              path: AppRootRoutes.loading.path,
              page: AppRootRoutes.loading.page,
              transitionsBuilder: TransitionsBuilders.noTransition,
              durationInMilliseconds: _duration,
            ),
            CustomRoute(
              transitionsBuilder: TransitionsBuilders.slideLeft,
              path: AppRootRoutes.dashboard.path,
              page: AppRootRoutes.dashboard.page,
              children: [
                AutoRoute(
                  path: AppNestedRoutes.files.path,
                  page: AppNestedRoutes.files.page,
                ),
                AutoRoute(
                  path: AppNestedRoutes.main.path,
                  page: AppNestedRoutes.main.page,
                ),

              ],
            ),
          ],
        ),
      ];

  List<PageRouteInfo> tabRoutes = const [
    IMainRoute(),
    IFavouritesRoute(),
  ];

  @override
  RouteType get defaultRouteType => const RouteType.material();

  AppRouter._();

  factory AppRouter.instance() => _router;
}
