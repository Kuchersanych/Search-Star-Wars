import 'package:dio/dio.dart';
import 'package:search_star_warriors/domain/entity/dto/dto.dart';
import 'package:surf_logger/surf_logger.dart';

/// Класс обработчик exception сущностей для презентативной логики
abstract class ExceptionHandler {

  /// Оболочка ошибок
  static String? shellException(Object e, trace) {
    final msg = _msgError(e);
    if (e is Exception) {
      Logger.e(
        msg ?? '',
        Exception('exception: ${e.toString()} \n trace: $trace'),
      );
    } else if (e is Error) {
      Logger.e(
        msg ?? '',
        Exception(trace),
      );
    }

    return msg;
  }

  /// Оболочка с обработчиком ошибок для функции
  static Future<void> shellFunction(Future Function() function) async {
    try {
      await function();
    } catch (e, trace) {
      shellException(e, trace);
    }
  }
}

String? _msgError(Object error) {
  if (error is DioException) {
    if (error.response == null) {
      return 'Ошибка сети';
    } else if (error.response!.data != null) {
      final data = DTO.fromJson(error.response!.data as Map<String, dynamic>);
      if (data.message != null) {
        return data.message;
      }
      return 'Ошибка по статус коду'; // TODO(daniil): Проработать статусы ошибок
    } else {
      return 'Ошибка по статус коду'; // TODO(daniil): Проработать статусы ошибок
    }
  } else if (error is Error) {
    /// Обработка ошибок парсинга
    return 'неизвестная ошибка';
  } else {
    return 'ошибка девайса?';
  }
}
