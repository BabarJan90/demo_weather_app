import 'package:json_annotation/json_annotation.dart';

part 'current_weather_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class CurrentWeatherDto {
  @JsonKey(name: 'temperature_2m')
  final double temperature;

  @JsonKey(name: 'weather_code')
  final int weatherCode;

  const CurrentWeatherDto({
    required this.temperature,
    required this.weatherCode,
  });

  factory CurrentWeatherDto.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentWeatherDtoToJson(this);
}
