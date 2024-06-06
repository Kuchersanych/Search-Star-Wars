import 'package:dio/dio.dart';
import 'package:search_star_warriors/domain/config/urls.dart';
import 'package:search_star_warriors/domain/entity/star_warrior.dart';
import 'package:search_star_warriors/domain/repositories/star_warriors_repository.dart';
import 'package:search_star_warriors/library/db/hive.dart';
import 'package:search_star_warriors/util/extensions/response_extentions.dart';

const _results = 'results';

/// Интерфейс для возамодействия с [MainService]
abstract class IMainService {
  /// Получение результата работы поиска.
  Future<List<StarWarrior>> getSearchStarWarrior(String query);

  /// Сохранение героя в избранное.
  void addStarWarrior(StarWarrior starWarrior);

  /// Получение списка избранных героев.
  Future<void> getAllFavorites();

}

class MainService implements IMainService {
  /// Принимаемые параметры.
  final Dio dio;
  final IHiveDB hiveDB;
  final IStarWarriorsRepository starWarriorsRepository;

  MainService({
    required this.dio,
    required this.hiveDB,
    required this.starWarriorsRepository,
  });

  @override
  Future<List<StarWarrior>> getSearchStarWarrior(String query) async {
    if(query.length > 1) {
      final response = await dio.get('${UrlRoutes.searchWarriors}$query');

      final data = response.toMap();
      if (data == null) throw Error();

      List<StarWarrior> starWarriors =
          List.from(data[_results]).map((e) => StarWarrior.fromJson(e)).toList();
      return starWarriors;
    }
    return [];
  }

  @override
  void addStarWarrior(StarWarrior starWarrior) async {
    starWarriorsRepository.addStarWarrior(starWarrior);
  }

  @override
  Future<void> getAllFavorites() async {
    await starWarriorsRepository.getAllFavorites();
  }
}
