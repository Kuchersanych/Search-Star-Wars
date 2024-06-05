class AutoGenerate {
  AutoGenerate({
    required this.results,
  });

  late final List<StarWarrior> results;

  AutoGenerate.fromJson(Map<String, dynamic> json) {
    results = List.from(json['results']).map((e) => StarWarrior.fromJson(e)).toList();
  }
}

class StarWarrior {
  StarWarrior({
    this.name,
    this.height,
    this.mass,
    this.hairColor,
    this.skinColor,
    this.eyeColor,
    this.birthYear,
    this.gender,
    this.homeworld,
    this.films,
    this.species,
    this.vehicles,
    this.starships,
    this.created,
    this.edited,
    this.url,
  });

  late final String? name;
  late final String? height;
  late final String? mass;
  late final String? hairColor;
  late final String? skinColor;
  late final String? eyeColor;
  late final String? birthYear;
  late final String? gender;
  late final String? homeworld;
  late final List<String>? films;
  late final List<dynamic>? species;
  late final List<String>? vehicles;
  late final List<String>? starships;
  late final String? created;
  late final String? edited;
  late final String? url;

  StarWarrior.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    height = json['height'];
    mass = json['mass'];
    hairColor = json['hair_color'];
    skinColor = json['skin_color'];
    eyeColor = json['eye_color'];
    birthYear = json['birth_year'];
    gender = json['gender'];
    homeworld = json['homeworld'];
    films = List.castFrom<dynamic, String>(json['films']);
    species = List.castFrom<dynamic, dynamic>(json['species']);
    vehicles = List.castFrom<dynamic, String>(json['vehicles']);
    starships = List.castFrom<dynamic, String>(json['starships']);
    created = json['created'];
    edited = json['edited'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['name'] = name;
    data['height'] = height;
    data['mass'] = mass;
    data['hair_color'] = hairColor;
    data['skin_color'] = skinColor;
    data['eye_color'] = eyeColor;
    data['birth_year'] = birthYear;
    data['gender'] = gender;
    data['homeworld'] = homeworld;
    data['films'] = films;
    data['species'] = species;
    data['vehicles'] = vehicles;
    data['starships'] = starships;
    data['created'] = created;
    data['edited'] = edited;
    data['url'] = url;
    return data;
  }
}
