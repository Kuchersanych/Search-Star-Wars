import 'package:flutter/cupertino.dart';

/// Состояние [InternalVM]
class InternalState {
  final int counter;

  InternalState({
    this.counter = 0,
  });

  String get counterUI => counter.toString();

  InternalState copyWith({
    int? counter,
  }) {
    return InternalState(
      counter: counter ?? this.counter,
    );
  }
}

/// Управление состоянием [InternalPage]
class InternalVM extends ChangeNotifier {
  /// Принимаемые параметры
  final int counter;
  late InternalState _state;

  InternalVM({
    required this.counter,
    required InternalState state,
  }) {
    _state = state;
    _init();
  }

  InternalState get state => _state;

  /// Действие при инициализации [InternalVM]
  void _init() {
    _state = _state.copyWith(counter: counter);
    notifyListeners();
  }
}
