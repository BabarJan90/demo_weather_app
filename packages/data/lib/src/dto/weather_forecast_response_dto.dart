import 'package:json_annotation/json_annotation.dart';

import 'current_weather_dto.dart';

part 'weather_forecast_response_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class WeatherForecastResponseDto {
  final CurrentWeatherDto current;

  const WeatherForecastResponseDto({required this.current});

  factory WeatherForecastResponseDto.fromJson(Map<String, dynamic> json) =>
      _$WeatherForecastResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherForecastResponseDtoToJson(this);
}
