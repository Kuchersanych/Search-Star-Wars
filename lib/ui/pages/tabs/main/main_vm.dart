import 'dart:async';

import 'package:flutter/material.dart';
import 'package:search_star_warriors/domain/entity/star_warrior.dart';
import 'package:search_star_warriors/domain/services/main_service.dart';
import 'package:search_star_warriors/library/scaffold_manager/scaffold_manager.dart';
import 'package:search_star_warriors/ui/common/show_action.dart';
import 'package:search_star_warriors/util/vm_utils.dart';

/// Состояние [MainVM]
class MainState {
  /// Статус получения данных для UI
  late ScaffoldManagerStatus statusPageSearch;

  /// Массив найденных фильмов.
  final List<StarWarrior> foundStarWarrior;

  /// Введен ли текст в поле поиска.
  final bool isSearchValue;

  MainState({
    this.statusPageSearch = ScaffoldManagerStatus.loaded,
    this.foundStarWarrior = const [],
    this.isSearchValue = false,
  });

  MainState copyWith({
    ScaffoldManagerStatus? statusPageSearch,
    List<StarWarrior>? foundStarWarrior,
    bool? isSearchValue,
  }) {
    return MainState(
      statusPageSearch: statusPageSearch ?? this.statusPageSearch,
      foundStarWarrior: foundStarWarrior ?? this.foundStarWarrior,
      isSearchValue: isSearchValue ?? this.isSearchValue,
    );
  }
}

/// Управление состоянием [MainPage]
class MainVM extends VMUtils<MainState> {
  /// Принимаемые параметры.
  late BuildContext context;
  late IMainService _mainService;

  /// Контроллер поля поиска.
  late TextEditingController searchController;

  MainVM(
    super.initialState, {
    required this.context,
    required IMainService mainService,
  }) {
    _mainService = mainService;
  }

  /// Таймер для
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
    notify(state.copyWith(statusPageSearch: ScaffoldManagerStatus.loading));
    await doFuture(
        future: _mainService.getSearchStarWarrior(query),
        onValue: (value) {
          notify(state.copyWith(
            foundStarWarrior: value,
            isSearchValue: true,
          ));
        },
        onError: (e, m) {
          ShowAction.showSmartSnackBar(
            context: context,
            title: m ?? 'Неизвестная ошибка',
          );
          notify(state.copyWith(
            statusPageSearch: ScaffoldManagerStatus.errorOther,
          ));
        });
    print(state.foundStarWarrior);
  }

  void addStarWarrior(StarWarrior starWarrior) {
    _mainService.addStarWarrior(starWarrior);
  }

  void getAllFavorites() {
    _mainService.getAllFavorites();
  }
}
