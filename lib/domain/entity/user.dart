/// Модель описания пользователя
class User {
  /// Имя
  final String name;

  /// Фамилия
  final String surName;

  /// Фото пользователя
  final String avatar;

  /// Пол
  final String gender;

  /// Почта
  final String email;

  /// Накопленные баллы
  final int points;

  User({
    required this.name,
    required this.surName,
    required this.avatar,
    required this.gender,
    required this.email,
    required this.points,
  });


  factory User.zero() {
    return User(
      name: 'Иван',
      surName: 'Иванов',
      avatar: 'https://sun9-36.userapi.com/impf/c625220/v625220779/47a86/-k9mm4ep9J4.jpg?size=604x403&quality=96&sign=824521c0adb36403e1cbadfa95f156ea&c_uniq_tag=Q-7TQOIKbsYyELhQ84pTjoOUAm6tLttdZLXSTkxZNW0&type=album',
      gender: 'male',
      email: 'example@mail.com',
      points: 100500,
    );
  }
}
