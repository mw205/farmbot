// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'spots_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpotsDataModel _$SpotsDataModelFromJson(Map<String, dynamic> json) =>
    SpotsDataModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      isDrought: json['is_drought'] as bool,
      isMature: json['is_mature'] as bool,
    );

Map<String, dynamic> _$SpotsDataModelToJson(SpotsDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'is_drought': instance.isDrought,
      'is_mature': instance.isMature,
    };
