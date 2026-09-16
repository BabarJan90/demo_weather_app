// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geocoding_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeocodingResultDto _$GeocodingResultDtoFromJson(Map<String, dynamic> json) =>
    GeocodingResultDto(
      name: json['name'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$GeocodingResultDtoToJson(GeocodingResultDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
