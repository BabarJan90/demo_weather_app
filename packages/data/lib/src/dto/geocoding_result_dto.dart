import 'package:json_annotation/json_annotation.dart';

part 'geocoding_result_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class GeocodingResultDto {
  final String name;
  final double latitude;
  final double longitude;

  const GeocodingResultDto({
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  factory GeocodingResultDto.fromJson(Map<String, dynamic> json) =>
      _$GeocodingResultDtoFromJson(json);

  Map<String, dynamic> toJson() => _$GeocodingResultDtoToJson(this);
}
