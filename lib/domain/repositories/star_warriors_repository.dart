import 'dart:async';

import 'package:search_star_warriors/domain/entity/star_warrior.dart';
import 'package:search_star_warriors/library/db/hive.dart';

/// Интерфейс для работы с репозиторием [StarWarriorsRepository].
abstract class IStarWarriorsRepository {
  /// Поток данных
  Stream<StarWarriorsRepositoryState> get stream;

  /// Геттер массива избранных героев.
  List<StarWarrior> get getFavorites;

  /// Добавление героя в избранное.
  Future<void> addStarWarrior(StarWarrior starWarrior);

  /// Получение массива избранных героев.
  Future<void> getAllFavorites();
}

/// Состояние репозитория [StarWarriorsRepository].
class StarWarriorsRepositoryState {
  /// Массив сохраненных героев.
  final List<StarWarrior> starWarriors;

  StarWarriorsRepositoryState({
    this.starWarriors = const [],
  });

  StarWarriorsRepositoryState copyWith({
    List<StarWarrior>? starWarriors,
  }) {
    return StarWarriorsRepositoryState(
      starWarriors: starWarriors ?? this.starWarriors,
    );
  }
}

String _starWarriors = 'StarWarriors';

/// Реализация интерфейса репозитория обработки данных и работы с хранилищем.
class StarWarriorsRepository implements IStarWarriorsRepository {
  late StarWarriorsRepositoryState _state;

  /// Локальное хранилище.
  late IHiveDB _hiveDB;

  StarWarriorsRepository({
    required IHiveDB hiveDB,
  }) {
    _state = StarWarriorsRepositoryState();
    _hiveDB = hiveDB;
  }
  @override
  List<StarWarrior> get getFavorites => _state.starWarriors;

  @override
  Future<void> addStarWarrior(
    StarWarrior starWarrior,
  ) async {
    List list = await _hiveDB.get(key: _starWarriors, defaultValue: []);
    var newList = list.cast<StarWarrior>();
    newList.add(starWarrior);
    await _hiveDB.put(key: _starWarriors, data: newList);
    _state = _state.copyWith(starWarriors: newList);
    _update();
  }

  @override
  Future<void> getAllFavorites() async {
    var currentWarriors = await _hiveDB.get(key: _starWarriors);
    List<StarWarrior> list = await currentWarriors.cast<StarWarrior>();
    _state = _state.copyWith(starWarriors: list);
    _update();

  }

  final StreamController<StarWarriorsRepositoryState> _streamController =
      StreamController<StarWarriorsRepositoryState>.broadcast();

  @override
  Stream<StarWarriorsRepositoryState> get stream => _streamController.stream.asBroadcastStream();

  /// Добавление события в стрим.
  void _update() {
    if (_streamController.isClosed) return;
    _streamController.add(_state);
  }
}
