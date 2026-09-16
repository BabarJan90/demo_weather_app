import 'package:json_annotation/json_annotation.dart';

import 'geocoding_result_dto.dart';

part 'geocoding_search_response_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class GeocodingSearchResponseDto {
  @JsonKey(defaultValue: <GeocodingResultDto>[])
  final List<GeocodingResultDto> results;

  const GeocodingSearchResponseDto({required this.results});

  factory GeocodingSearchResponseDto.fromJson(Map<String, dynamic> json) =>
      _$GeocodingSearchResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GeocodingSearchResponseDtoToJson(this);
}
