import 'package:flutter/material.dart';
import 'package:search_star_warriors/util/vm_utils.dart';

/// Состояние [DashboardVM]
class DashboardState {
  /// Index вбраного экрана
  final int currentIndex;

  DashboardState({
    this.currentIndex = 0,
  });

  DashboardState copyWith({
    int? currentIndex,
    bool? isShowBodyRoutes,
  }) {
    return DashboardState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}

/// Управление состоянием [DashboardPage]
class DashboardVM extends VMUtils<DashboardState> {
  /// Принимаемые параметры
  final BuildContext context;

  DashboardVM(
    DashboardState state, {
    required this.context,
  }) : super(state);

  /// Коллбак на изминения индекса авктивной вкладки
  set indexPage(int index) {
    notify(
      state.copyWith(currentIndex: index),
    );
  }
}
