import 'package:asa/services/api/source/model_factory.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class UserModel implements ModelFactory {
  String id;

  String username;
  String phone;
  String email;

  @JsonKey(name: "profile_picture")
  String profilePicture;

  @JsonKey(name: "account_type")
  String type;
  String gender;

  @JsonKey(name: "is_verified")
  bool isVerified;
  String password;

  String CreatedAt;
  String UpdatedAt;

  UserModel({
    required this.CreatedAt,
    required this.UpdatedAt,
    required this.email,
    required this.gender,
    required this.id,
    required this.isVerified,
    required this.phone,
    required this.profilePicture,
    required this.type,
    required this.username,
    required this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
