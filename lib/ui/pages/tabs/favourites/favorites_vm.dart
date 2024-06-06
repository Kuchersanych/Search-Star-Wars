import 'package:flutter/material.dart';
import 'package:search_star_warriors/domain/entity/star_warrior.dart';
import 'package:search_star_warriors/domain/repositories/star_warriors_repository.dart';
import 'package:search_star_warriors/util/vm_utils.dart';

/// Состояние [FavouritesVM]
class FavouritesVMState {
  /// Сохраненные файлы.
  final List<StarWarrior> favorites;

  FavouritesVMState({
    this.favorites = const [],
  });

  FavouritesVMState copyWith({
    List<StarWarrior>? favorites,
  }) {
    return FavouritesVMState(
      favorites: favorites ?? this.favorites,
    );
  }
}

/// Управление состоянием [ExamplePage1]
class FavouritesVM extends VMUtils<FavouritesVMState> {
  /// Принимаемые параметры
  final BuildContext context;

  /// Репозиторий.
  late IStarWarriorsRepository _starWarriorsRepository;

  FavouritesVM(
    super.initialState, {
    required this.context,
    required IStarWarriorsRepository starWarriorsRepository,
  }) {
    _starWarriorsRepository = starWarriorsRepository;
    _getFavorites();

    addSubscription(
      _starWarriorsRepository.stream,
      _subscribeStarWarriorsRepository,
    );
  }

  /// Прослушивание изменений [StarWarriorsRepository].
  void _subscribeStarWarriorsRepository(StarWarriorsRepositoryState stateRepository) {
    state = state.copyWith(
      favorites: stateRepository.starWarriors,
    );
    notify();
  }

  /// Получение массива избранных героев.
  Future<void> _getFavorites() async {
    await doFuture(future: _starWarriorsRepository.getAllFavorites(), onValue: (value) {
      notify(state.copyWith(favorites: _starWarriorsRepository.getFavorites));
    });

  }
}
