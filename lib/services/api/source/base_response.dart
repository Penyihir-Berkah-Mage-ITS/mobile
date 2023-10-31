class BaseResponse {
  String message;
  bool success;
  String? error;

  BaseResponse({
    required this.message,
    required this.success,
    this.error,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(
        message: json["message"],
        success: json["success"],
        error: json["error"],
      );

  Map<dynamic, dynamic> toJson() => <String, dynamic>{
        'message': message,
        'success': success,
        'error': error,
      };
}
