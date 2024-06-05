import 'package:dio/dio.dart';

/// Расширения [Response]
extension ObjectExtentions on Response {

  Map<dynamic, dynamic>? toMap(){
    try {
      return data;
    } catch (e) {
      if (data is String) return {};
      Map<dynamic, dynamic> map = {
        for (var item in data) '$item': item
      };
      return map;
    }
  }
}
