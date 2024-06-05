import 'dart:async';

/// mixin с реализацией реактивного потока данных
mixin StreamEvent<T> {
  /// Последнее актуальное состояние
  late T state;

  /// StreamController для реализации потока данных [T]
  final StreamController<T> _stream = StreamController<T>.broadcast();

  /// Первоначальная инициализация [T]
  set initStream(T t) => state = t;

  /// Поток актуальных данных
  Stream<T> get stream => _stream.stream.asBroadcastStream();

  /// Добавление события
  set addEvent(T t) {
    if (_stream.isClosed) return;
    initStream = t;
    _stream.add(state);
  }

  /// Закрытие [_stream]
  void dispose() {
    if (_stream.isClosed) return;
    _stream.close();
  }
}