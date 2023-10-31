// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'regency_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegencyModel _$RegencyModelFromJson(Map<String, dynamic> json) => RegencyModel(
      id: json['id'] as String,
      name: json['name'] as String,
      province_id: json['province_id'] as String,
    );

Map<String, dynamic> _$RegencyModelToJson(RegencyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'province_id': instance.province_id,
      'name': instance.name,
    };
