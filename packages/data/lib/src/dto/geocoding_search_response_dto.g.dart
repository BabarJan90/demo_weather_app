// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'geocoding_search_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeocodingSearchResponseDto _$GeocodingSearchResponseDtoFromJson(
  Map<String, dynamic> json,
) => GeocodingSearchResponseDto(
  results:
      (json['results'] as List<dynamic>?)
          ?.map((e) => GeocodingResultDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      [],
);

Map<String, dynamic> _$GeocodingSearchResponseDtoToJson(
  GeocodingSearchResponseDto instance,
) => <String, dynamic>{
  'results': instance.results.map((e) => e.toJson()).toList(),
};
