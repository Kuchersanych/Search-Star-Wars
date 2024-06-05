import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:search_star_warriors/domain/config/urls.dart';
import 'package:search_star_warriors/domain/entity/star_warrior.dart';
import 'package:search_star_warriors/library/flutter_storages/app_shared_preferences.dart';
import 'package:search_star_warriors/util/extensions/response_extentions.dart';


const _films = 'films';

/// Интерфейс для возамодействия с [MainService]
abstract class IMainService {
  /// Получение результата работы поиска.
  Future<List<StarWarrior>> getSearchStarWarrior(String query);

  // /// Сохранение фильма.
  // void saveFilm(StarWarrior film);
  //
  // /// Сохранение сериала.
  // void saveSerial(StarWarrior film);
  //
  // /// Получение списка сохраненных фильмов.
  // Future<List<StarWarrior>> getFilms();
  //
  // /// Получение списка сохраненных сериалов.
  // Future<List<StarWarrior>> getSerials();
}

class MainService implements IMainService {
  /// Принимаемые параметры.
  final Dio dio;
  final IAppSharedPreferences sharedPreferences;

  MainService({
    required this.dio,
    required this.sharedPreferences,
  });

  @override
  Future<List<StarWarrior>> getSearchStarWarrior(String query) async {
    final response = await dio.get('${UrlRoutes.searchWarriors}$query');

    final data = response.toMap();
    if (data == null) throw Error();

    List<StarWarrior> starWarriors = List.from(data['results']).map((e) => StarWarrior.fromJson(e)).toList();
    return starWarriors;
  }

  // @override
  // void saveFilm(StarWarrior film) async {
  //   // final List<String> films = await sharedPreferences.getListString('films') ?? [];
  //   //
  //   // Map<String, dynamic> data = film.toJson();
  //   // final String stringFilm = const JsonEncoder().convert(data);
  //   // films.add(stringFilm);
  //   // sharedPreferences.setListString('films', films);
  // }
  //
  // @override
  // void saveSerial(FilmData film) async {
  //   // final List<String> serials = await sharedPreferences.getListString('serials') ?? [];
  //   //
  //   // Map<String, dynamic> data = film.toJson();
  //   // final String stringFilm = const JsonEncoder().convert(data);
  //   // serials.add(stringFilm);
  //   // sharedPreferences.setListString('serials', serials);
  // }

  // @override
  // Future<List<FilmData>> getFilms() async {
  //   List<String> jsonFilms = await sharedPreferences.getListString(_films) ?? [];
  //   var newFilms = jsonFilms.map((e) => FilmData.fromJson(jsonDecode(e))).toList();
  //   return newFilms;
  // }

  // @override
  // Future<List<FilmData>> getSerials() {
  //   // TODO: implement getSerials
  //   throw UnimplementedError();
  // }
}
