import 'package:flutter/material.dart';
import 'package:search_star_warriors/domain/entity/star_warrior.dart';
import 'package:search_star_warriors/domain/repositories/films_repository.dart';
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

  ///
  late IStarWarriorsRepository _starWarriorsRepository;

  FavouritesVM(
    super.initialState, {
    required this.context,
    required IStarWarriorsRepository starWarriorsRepository,
  }) {
    _starWarriorsRepository = starWarriorsRepository;
    _getFilms();
  }

  ///
  void _init() {
    addSubscription(
      _starWarriorsRepository.stream,
      (event) {},
    );
  }

  /// Инкрементирование
  void increment() {
    notify(state.copyWith());
  }

  /// Декрементирование
  void decrement() {
    notify(state.copyWith());
  }

  /// Получение списка сохраненных фильмов.
  Future<void> _getFilms() async {
    // doFuture(
    //     future: _mainService.getFilms(),
    //     onValue: (value) {
    //       print(value);
    //       notify(state.copyWith(films: value));
    //     });
  }
}
