import 'package:hive/hive.dart';

class StarWarrior {
  StarWarrior({
    required this.name,
    required this.gender,
    required this.starships,
    required this.isFavorite,
  });

  late final String name;
  late final String gender;
  late final List<String> starships;
  late bool isFavorite;

  StarWarrior.fromJson(Map<String, dynamic> json) {
    name = json['name'] ?? '';
    gender = json['gender'] ?? '';
    starships = List.castFrom<dynamic, String>(json['starships']);
    isFavorite = false;
  }
}

/// Адаптер класса [StarWarriors] для [Hive].
class StarWarriorsAdapter extends TypeAdapter<StarWarrior> {
  @override
  int get typeId => 0;

  @override
  StarWarrior read(BinaryReader reader) {
    final name = reader.read();
    final gender = reader.read();
    final starships = reader.read();
    return StarWarrior(
      name: name,
      gender: gender,
      starships: starships,
      isFavorite: true,
    );
  }

  @override
  void write(BinaryWriter writer, StarWarrior obj) {
    writer.write(obj.name);
    writer.write(obj.gender);
    writer.write(obj.starships);
  }
}
