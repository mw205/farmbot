// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';

part 'spots_data_model.g.dart';

@JsonSerializable()
class SpotsDataModel {
  final int id;
  final String name;
  @JsonKey(name: "is_drought")
  final bool isDrought;
  @JsonKey(name: "is_mature")
  final bool isMature;
  SpotsDataModel({
    required this.id,
    required this.name,
    required this.isDrought,
    required this.isMature,
  });
  factory SpotsDataModel.fromJson(Map<String, dynamic> json) =>
      _$SpotsDataModelFromJson(json);
  Map<String, dynamic> toJson() => _$SpotsDataModelToJson(this);
}
