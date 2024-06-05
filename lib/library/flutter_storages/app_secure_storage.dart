import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Локальное защищенное хранилище
abstract class IAppSecureStorage {

  Future<void> write({required String key, required String? value});

  Future<String?> read({required String key});

  Future<void> delete({required String key});
}

class AppSecureStorage implements IAppSecureStorage {
  final FlutterSecureStorage _storage;

  AppSecureStorage(this._storage);

  @override
  Future<void> write({required String key, required String? value}) async => await  _storage.write(key: key, value: value);

  @override
  Future<void> delete({required String key}) async => await _storage.delete(key: key);

  @override
  Future<String?> read({required String key}) async => await _storage.read(key: key);
}
