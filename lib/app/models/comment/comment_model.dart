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

  @JsonKey(name: "is_liked")
  bool? isLiked;

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
    required this.isLiked,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);
  Map<String, dynamic> toJson() => _$CommentModelToJson(this);

  CommentModel copyWith({
    String? CreatedAt,
    String? UpdatedAt,
    String? content,
    String? id,
    int? like,
    PostModel? post,
    String? postId,
    UserModel? user,
    String? userId,
    bool? isLiked,
  }) =>
      CommentModel(
        CreatedAt: CreatedAt ?? this.CreatedAt,
        UpdatedAt: UpdatedAt ?? this.UpdatedAt,
        user: user ?? this.user,
        content: content ?? this.content,
        id: id ?? this.id,
        like: like ?? this.like,
        post: post ?? this.post,
        postId: postId ?? this.postId,
        userId: userId ?? this.userId,
        isLiked: isLiked ?? this.isLiked,
      );
}
