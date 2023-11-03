import 'package:asa/app/models/user/user_model.dart';
import 'package:asa/services/api/source/model_factory.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_model.g.dart';

@JsonSerializable()
class PostModel implements ModelFactory {
  String id;

  @JsonKey(name: "User")
  UserModel User;

  @JsonKey(name: "user_id")
  String userId;
  String content;
  String attachment;
  int likes;
  bool? is_liked;
  String CreatedAt;
  String UpdatedAt;

  PostModel({
    required this.CreatedAt,
    required this.UpdatedAt,
    required this.User,
    required this.attachment,
    required this.content,
    required this.id,
    required this.likes,
    required this.userId,
    this.is_liked,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) =>
      _$PostModelFromJson(json);
  Map<String, dynamic> toJson() => _$PostModelToJson(this);

  PostModel copyWith({
    String? CreatedAt,
    String? UpdatedAt,
    UserModel? User,
    String? attachment,
    String? content,
    String? id,
    int? likes,
    String? userId,
    bool? is_liked,
  }) =>
      PostModel(
        CreatedAt: CreatedAt ?? this.CreatedAt,
        UpdatedAt: UpdatedAt ?? this.UpdatedAt,
        User: User ?? this.User,
        attachment: attachment ?? this.attachment,
        content: content ?? this.content,
        id: id ?? this.id,
        likes: likes ?? this.likes,
        userId: userId ?? this.userId,
        is_liked: is_liked ?? this.is_liked,
      );
}
