import 'package:shared_preferences/shared_preferences.dart';

/// Локальное хранилище
abstract class IAppSharedPreferences{

  Future<bool> setString(String key, String value);

  Future<String?> getString(String key);

  Future<bool> setBool(String key, bool value);

  Future<bool?> getBool(String key);

  Future<bool> setInt(String key, int value);
  
  Future<bool> setListString(String key, List<String> value);

  Future<List<String>?> getListString(String key);

  Future<int?> getInt(String key);

  Future<bool> remove(String key);
}

class AppSharedPreferences implements IAppSharedPreferences{
  final _storage = SharedPreferences.getInstance();

  @override
  Future<bool?> getBool(String key) async{
    final storage = await _storage;
    return storage.getBool(key);
  }

  @override
  Future<String?> getString(String key) async{
   final storage = await _storage;
   return storage.getString(key);
  }

  @override
  Future<bool> remove(String key) async {
    final storage = await _storage;
    return await storage.remove(key);
  }

  @override
  Future<bool> setBool(String key, bool value) async {
    final storage = await _storage;
    return await storage.setBool(key, value);
  }

  @override
  Future<bool> setString(String key, String value) async {
    final storage = await _storage;
    return await storage.setString(key, value);
  }
  
  @override
  Future<bool> setListString (String key, List<String> films) async {
    final storage = await _storage;
    return await storage.setStringList(key, films);
  }

  @override
  Future<List<String>?> getListString (String key) async{
    final storage = await _storage;
    return storage.getStringList(key);
  }

  @override
  Future<bool> setInt(String key, int value) async {
    final storage = await _storage;
    return await storage.setInt(key, value);
  }

  @override
  Future<int?> getInt(String key) async{
    final storage = await _storage;
    return storage.getInt(key);
  }
}