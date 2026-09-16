// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_forecast_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherForecastResponseDto _$WeatherForecastResponseDtoFromJson(
  Map<String, dynamic> json,
) => WeatherForecastResponseDto(
  current: CurrentWeatherDto.fromJson(json['current'] as Map<String, dynamic>),
);

Map<String, dynamic> _$WeatherForecastResponseDtoToJson(
  WeatherForecastResponseDto instance,
) => <String, dynamic>{'current': instance.current.toJson()};
