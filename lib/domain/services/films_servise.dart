

/// Все подписать
abstract class IFilmsService {
  Future<void> add();
  Future<void> getAll();
  Future<void> get();
  Future<void> delete();
}

class  FilmsService implements IFilmsService {
  @override
  Future<void> add() async {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future<void> delete() async {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<void> get() async {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<void> getAll() async {
    // TODO: implement getAll
    throw UnimplementedError();
  }
}
