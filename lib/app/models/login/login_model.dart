import 'package:asa/services/api/source/model_factory.dart';
import 'package:json_annotation/json_annotation.dart';
part 'login_model.g.dart';

@JsonSerializable()
class LoginModel implements ModelFactory {
  String name;
  String token;
  String type;

  LoginModel({
    required this.name,
    required this.token,
    required this.type,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);
  Map<String, dynamic> toJson() => _$LoginModelToJson(this);
}
