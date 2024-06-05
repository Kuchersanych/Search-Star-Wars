import 'package:json_annotation/json_annotation.dart';

part 'dto.g.dart';

/// Точка входа в DTO модели
@JsonSerializable()
class DTO {
  /// Ответ
  final dynamic data;

  /// [Error]
  final String? message;

  /// Статус
  final bool status;

  /// Код статуса
  final num statusCode;

  /// Конструктор [DTO]
  DTO({
    required this.data,
    required this.status,
    required this.statusCode,
    this.message,
  });

  /// Преобразование из json
  factory DTO.fromJson(Map<String, dynamic> json) => _$DTOFromJson(json);

  /// Преобразование в json
  Map<String, dynamic> toJson() => _$DTOToJson(this);
}
