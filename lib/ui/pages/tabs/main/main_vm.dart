import 'dart:async';

import 'package:flutter/material.dart';
import 'package:search_star_warriors/domain/entity/star_warrior.dart';
import 'package:search_star_warriors/domain/repositories/star_warriors_repository.dart';
import 'package:search_star_warriors/domain/services/main_service.dart';
import 'package:search_star_warriors/ui/common/show_action.dart';
import 'package:search_star_warriors/util/vm_utils.dart';

/// Состояние [MainVM]
class MainState {
  /// Массив найденных героев.
  final List<StarWarrior> foundStarWarrior;

  /// Введен ли текст в поле поиска.
  final bool isSearchValue;

  MainState({
    this.foundStarWarrior = const [],
    this.isSearchValue = false,
  });

  MainState copyWith({
    List<StarWarrior>? foundStarWarrior,
    bool? isSearchValue,
  }) {
    return MainState(
      foundStarWarrior: foundStarWarrior ?? this.foundStarWarrior,
      isSearchValue: isSearchValue ?? this.isSearchValue,
    );
  }
}

/// Управление состоянием [MainPage]
class MainVM extends VMUtils<MainState> {
  late BuildContext context;
  late IMainService _mainService;
  late IStarWarriorsRepository _starWarriorsRepository;

  /// Контроллер поля поиска.
  late TextEditingController searchController;

  MainVM(
    super.initialState, {
    required this.context,
    required IMainService mainService,
    required IStarWarriorsRepository starWarriorsRepository,
  }) {
    _starWarriorsRepository = starWarriorsRepository;
    _mainService = mainService;

  }

  /// Таймер задержки отправки запроса при вводе текста.
  Timer? _timer;

  @override
  init() {
    searchController = TextEditingController();
    searchController.addListener(_getSearch);
  }

  /// Коллбак на изменение поля поиска.
  void _getSearch() {
    if (searchController.text == ' ') {
      searchController.text = '';
    }
    if (_timer != null) {
      _timer!.cancel();
    }
    _timer = Timer(const Duration(milliseconds: 500), () async {
      getSearchResult(searchController.text);
    });
  }

  /// Запрос поиска.
  Future<void> getSearchResult(String query) async {
    if (query.isEmpty) {
      notify(state.copyWith(
        isSearchValue: false,
        foundStarWarrior: [],
      ));
      return;
    }
    await doFuture(
        future: _mainService.getSearchStarWarrior(query),
        onValue: (value) {
          _checkFavorite(value);
          notify(state.copyWith(

            isSearchValue: true,
          ));
        },
        onError: (e, m) {
          ShowAction.showSmartSnackBar(
            context: context,
            title: m ?? 'Неизвестная ошибка',
          );
          notify(state.copyWith());
        });
  }

  void addStarWarrior(StarWarrior starWarrior) {
    _mainService.addStarWarrior(starWarrior);
  }

  void _checkFavorite(List<StarWarrior> value) {
    List<StarWarrior> favorites = _starWarriorsRepository.getFavorites;
    for (var i in favorites) {
      for (var e in value) {
        if (i.name == e.name) {
          e.isFavorite = true;
        }
      }
    }
    notify(state.copyWith(foundStarWarrior: value));
  }
}
