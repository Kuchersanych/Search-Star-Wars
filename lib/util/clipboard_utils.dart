import 'package:flutter/services.dart';

class ClipboardDataUtil {
  final String? text;
  const ClipboardDataUtil({ required String this.text });
}

mixin ClipboardUtil {
  static const String kTextPlain = 'text/plain';

  /// Сохраняет заданные данные буфера обмена в буфере обмена.
  Future<void> setData(ClipboardDataUtil data) async {
    await SystemChannels.platform.invokeMethod<void>(
      'Clipboard.setData',
      <String, dynamic>{
        'text': data.text,
      },
    );
  }

  /// Извлекает данные из буфера обмена, соответствующие заданному формату.
  ///
  /// Аргумент `format` указывает тип носителя, такой как `text/plain`,
  /// данных, которые необходимо получить.
  ///
  /// Возвращает будущее, которое завершается значением null, если данные не могут быть получены
  /// получено, и к объекту [clipboardData], если бы это было возможно.
  static Future<ClipboardDataUtil?> getData(String format) async {
    final Map<String, dynamic>? result = await SystemChannels.platform.invokeMethod(
      'Clipboard.getData',
      format,
    );
    if (result == null) {
      return null;
    }
    return ClipboardDataUtil(text: result['text'] as String);
  }

  /// Возвращает значение future, которое принимает значение true, если буфер обмена содержит строковые данные.
  static Future<bool> hasStrings() async {
    final Map<String, dynamic>? result = await SystemChannels.platform.invokeMethod(
      'Clipboard.hasStrings',
      Clipboard.kTextPlain,
    );
    if (result == null) {
      return false;
    }
    return result['value'] as bool;
  }
}
