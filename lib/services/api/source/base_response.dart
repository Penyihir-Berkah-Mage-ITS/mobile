class BaseResponse {
  String message;
  int status;

  BaseResponse({
    required this.message,
    required this.status,
  });

  factory BaseResponse.fromJson(Map<String, dynamic> json) => BaseResponse(
        message: json["message"],
        status: json["status"],
      );

  Map<dynamic, dynamic> toJson() => <String, dynamic>{
        'message': message,
        'status': status,
      };
}
