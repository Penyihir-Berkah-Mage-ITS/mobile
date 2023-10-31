import 'package:json_annotation/json_annotation.dart';
part 'regency_model.g.dart';

@JsonSerializable()
class RegencyModel {
  final String id;
  final String province_id;
  final String name;

  const RegencyModel({
    required this.id,
    required this.name,
    required this.province_id,
  });

  factory RegencyModel.fromJson(Map<String, dynamic> json) =>
      _$RegencyModelFromJson(json);
  Map<String, dynamic> toJson() => _$RegencyModelToJson(this);
}
