import 'package:asa/services/api/source/base_response.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:asa/services/api/source/model_factory.dart';

class ApiResponse<T> extends BaseResponse {
  final T? data;

  ApiResponse({
    this.data,
    required super.message,
    required super.success,
    super.error,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    if (json['data'] == null) {
      return ApiResponse<T>(
        message: json["message"],
        success: json["success"],
        error: json["error"],
      );
    }
    if (T == dynamic) {
      return ApiResponse<T>(
        message: json["message"],
        success: json["success"],
        error: json["error"],
        data: json['data'],
      );
    }
    return ApiResponse<T>(
      message: json["message"],
      success: json["success"],
      error: json["error"],
      data: _Converter<T>().fromJson(json['data']),
    );
  }
}

class ApiResponses<T> extends BaseResponse {
  List<T>? data;

  ApiResponses({
    this.data,
    required super.message,
    required super.success,
    super.error,
  });

  factory ApiResponses.fromJson(
    Map<String, dynamic> json,
  ) {
    if (json['data'] == null) {
      return ApiResponses<T>(
        message: json["message"],
        success: json["success"],
        error: json["error"],
      );
    }
    if (T == dynamic) {
      return ApiResponses<T>(
        message: json["message"],
        success: json["success"],
        error: json["error"],
        data: json['data'],
      );
    }
    return ApiResponses<T>(
      message: json["message"],
      success: json["success"],
      error: json["error"],
      data: List<T>.from((json["results"] ?? json["data"])
          .map((x) => _Converter<T?>().fromJson(x))),
    );
  }
}

class _Converter<T> implements JsonConverter<T?, Object?> {
  const _Converter();

  @override
  T? fromJson(Object? json) {
    if (json is Map<String, dynamic>) {
      return ModelFactory.fromJson(T, json) as T;
    }
    return json as Null;
  }

  @override
  Object toJson(T? object) {
    return (object as Object);
  }
}
