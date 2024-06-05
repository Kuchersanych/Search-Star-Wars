import 'package:search_star_warriors/domain/config/app_config.dart';
import 'package:search_star_warriors/domain/config/debug_options.dart';
import 'package:search_star_warriors/domain/config/environment/build_types.dart';
import 'package:search_star_warriors/domain/config/environment/environment.dart';
import 'package:search_star_warriors/domain/config/urls.dart';
import 'package:search_star_warriors/runner.dart';

/// Точка входа в приложение в режиме релиза.
void main() {
  Environment.init(
    buildType: BuildType.release,
    config: AppConfig(
      url: Url.prodUrl,
      wsUrl: Url.prodWsUrl,
      proxyUrl: Url.prodProxyUrl,
      debugOptions: DebugOptions(),
    ),
  );

  run();
}
