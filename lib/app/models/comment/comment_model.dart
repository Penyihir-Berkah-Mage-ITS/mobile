import 'package:asa/app/models/post/post_model.dart';
import 'package:asa/app/models/user/user_model.dart';
import 'package:asa/services/api/source/model_factory.dart';
import 'package:json_annotation/json_annotation.dart';

part 'comment_model.g.dart';

@JsonSerializable()
class CommentModel implements ModelFactory {
  String id;

  @JsonKey(name: "User")
  UserModel user;

  @JsonKey(name: "user_id")
  String userId;

  @JsonKey(name: "Post")
  PostModel post;

  @JsonKey(name: 'post_id')
  String postId;

  String content;
  int like;
  String CreatedAt;
  String UpdatedAt;

  CommentModel({
    required this.CreatedAt,
    required this.UpdatedAt,
    required this.content,
    required this.id,
    required this.like,
    required this.post,
    required this.postId,
    required this.user,
    required this.userId,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);
  Map<String, dynamic> toJson() => _$CommentModelToJson(this);
}
