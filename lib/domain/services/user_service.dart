
import 'package:search_star_warriors/domain/entity/user.dart';

/// Интерфейс работы с профилем пользователя
abstract class IUserService {

  /// Получение профиля пользователя
  Future<User> getUser();
}

/// Реализация [IUserService]
class UserService implements IUserService{

  @override
  Future<User> getUser() async{
    return User.zero();
  }
}