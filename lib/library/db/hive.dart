import 'dart:async';

import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:search_star_warriors/domain/entity/star_warrior.dart';

abstract class IHiveDB<T extends TypeAdapter, E> {

  /// Инициализация
  Future<void> init();

  /// Поток актуальных данных
  Stream<List<E>> get state;

  /// Текущие актуальные данные
  List<E> get currentState;

  /// Добавление данных
  Future<void> add(dynamic data);

  /// Чтение по ключу
  Future<E?> get({dynamic key, dynamic defaultValue});

  /// Чтение по [index]
  Future<E?> getAt(int index);

  /// Удаление по [index]
  Future<void> deleteAt(int index);

  /// Запись по [index]
  Future<void> putAt({required int index, required dynamic data});

  /// Запись по [key]
  Future<void> put({required dynamic key, required E data});

  /// Очистка Box
  Future<void> clear();

  /// Закрытие Box
  Future<void> close();
}

class HiveDB<T extends TypeAdapter, E> implements IHiveDB<T, E> {
  late Box<E> _box;
  final int adapterCount;
  final T adapter;
  final String tablesName;

  HiveDB({
    required this.adapterCount,
    required this.adapter,
    required this.tablesName,
  });

  @override
  Future<void> init() async {
    Hive.init((await getApplicationDocumentsDirectory()).path);
    _registerAdapter(adapterCount: adapterCount, adapter: adapter);
    await _openBox(tablesName);
  }

  /// Регистрация адаптера
  void _registerAdapter({required int adapterCount, required T adapter}) {
    if (!Hive.isAdapterRegistered(adapterCount)) {
      Hive.registerAdapter<StarWarrior>(StarWarriorsAdapter());
    }
  }

  /// Открытие Box
  Future<void> _openBox(String tablesName) async =>
      _box = await Hive.openBox<E>(tablesName);

  final StreamController<List<E>> _state =
      StreamController<List<E>>.broadcast();

  @override
  Stream<List<E>> get state => _state.stream.asBroadcastStream();

  @override
  List<E> get currentState => _box.values.toList();

  @override
  Future<void> deleteAt(int index) async {
    await _box.deleteAt(index);
    _update();
  }

  @override
  Future<void> put({required dynamic key, required dynamic data}) async {
    await _box.put(key, data);
    _update();
  }

  @override
  Future<void> add(data) async {
    await _box.add(data);
    _update();
  }

  @override
  Future<void> putAt({required int index, required data}) async {
    await _box.putAt(index, data);
    _update();
  }

  @override
  Future<E?> get({dynamic key, dynamic defaultValue}) async {
    _box.get(key);
    _update();
    return _box.get(key, defaultValue: defaultValue);
  }

  @override
  Future<E?> getAt(int index) async {
    _update();
    return _box.getAt(index);
  }

  @override
  Future<void> clear() async => await _box.clear();

  @override
  Future<void> close() async => await _box.close();

  void _update() {
    if (_state.isClosed) return;
    _state.add(_box.values.toList());
  }
}
