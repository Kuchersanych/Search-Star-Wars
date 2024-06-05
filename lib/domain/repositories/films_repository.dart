import 'package:search_star_warriors/library/flutter_storages/app_shared_preferences.dart';
import 'package:search_star_warriors/util/stream_event.dart';

const _films = 'films';

/// Все подписать!
abstract class IStarWarriorsRepository {
  /// Актуальные данные
  List<String> get state;

  /// Поток данных
  Stream<List<String>> get stream;

  /// Добавление фильма
  Future<void> add(String film);

  ///
  Future<List<String>> getAll();

  ///
  Future<void> get(int id);

  ///
  Future<void> delete(int id);
}

///
class StarWarriorsRepository with StreamEvent<List<String>> implements IStarWarriorsRepository {
  ///
  late IAppSharedPreferences _sharedPreferences;

  StarWarriorsRepository({
    required IAppSharedPreferences sharedPreferences,
  }) {
    _sharedPreferences = sharedPreferences;
    getAll();
  }

  @override
  Future<void> add(
    String film,
  ) async {
    List<String> currentFilms = await getAll();
    currentFilms.add(film);
    await _sharedPreferences.setListString(_films, currentFilms);
  }

  @override
  Future<void> delete(int id) async {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<void> get(int id) async {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<List<String>> getAll() async {
    List<String> currentFilms = await _sharedPreferences.getListString(_films) ?? [];
    addEvent = currentFilms;
    return currentFilms;
  }
}
