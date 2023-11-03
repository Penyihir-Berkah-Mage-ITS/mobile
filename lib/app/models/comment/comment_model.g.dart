// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CommentModel _$CommentModelFromJson(Map<String, dynamic> json) => CommentModel(
      CreatedAt: json['CreatedAt'] as String,
      UpdatedAt: json['UpdatedAt'] as String,
      content: json['content'] as String,
      id: json['id'] as String,
      like: json['like'] as int,
      post: PostModel.fromJson(json['Post'] as Map<String, dynamic>),
      postId: json['post_id'] as String,
      user: UserModel.fromJson(json['User'] as Map<String, dynamic>),
      userId: json['user_id'] as String,
      isLiked: json['is_liked'] as bool?,
    );

Map<String, dynamic> _$CommentModelToJson(CommentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'User': instance.user,
      'user_id': instance.userId,
      'Post': instance.post,
      'post_id': instance.postId,
      'content': instance.content,
      'like': instance.like,
      'CreatedAt': instance.CreatedAt,
      'UpdatedAt': instance.UpdatedAt,
      'is_liked': instance.isLiked,
    };
