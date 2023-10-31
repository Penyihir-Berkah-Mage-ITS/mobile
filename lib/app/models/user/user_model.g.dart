// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserModel _$UserModelFromJson(Map<String, dynamic> json) => UserModel(
      CreatedAt: json['CreatedAt'] as String,
      UpdatedAt: json['UpdatedAt'] as String,
      email: json['email'] as String,
      gender: json['gender'] as String,
      id: json['id'] as String,
      isVerified: json['is_verified'] as bool,
      phone: json['phone'] as String,
      profilePicture: json['profile_picture'] as String,
      type: json['account_type'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$UserModelToJson(UserModel instance) => <String, dynamic>{
      'ID': instance.id,
      'username': instance.username,
      'phone': instance.phone,
      'email': instance.email,
      'profile_picture': instance.profilePicture,
      'account_type': instance.type,
      'gender': instance.gender,
      'password': instance.password,
      'is_verified': instance.isVerified,
      'CreatedAt': instance.CreatedAt,
      'UpdatedAt': instance.UpdatedAt,
    };
