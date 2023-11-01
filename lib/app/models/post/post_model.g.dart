// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PostModel _$PostModelFromJson(Map<String, dynamic> json) => PostModel(
      CreatedAt: json['CreatedAt'] as String,
      UpdatedAt: json['UpdatedAt'] as String,
      User: UserModel.fromJson(json['User'] as Map<String, dynamic>),
      attachment: json['attachment'] as String,
      content: json['content'] as String,
      id: json['id'] as String,
      like: json['like'] as int,
      userId: json['user_id'] as String,
    );

Map<String, dynamic> _$PostModelToJson(PostModel instance) => <String, dynamic>{
      'id': instance.id,
      'User': instance.User,
      'user_id': instance.userId,
      'content': instance.content,
      'attachment': instance.attachment,
      'like': instance.like,
      'CreatedAt': instance.CreatedAt,
      'UpdatedAt': instance.UpdatedAt,
    };
