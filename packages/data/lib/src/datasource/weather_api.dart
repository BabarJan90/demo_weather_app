import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../dto/geocoding_search_response_dto.dart';
import '../dto/weather_forecast_response_dto.dart';

const kGeocodingSearchUrl = 'https://geocoding-api.open-meteo.com/v1/search';
const kWeatherForecastUrl = 'https://api.open-meteo.com/v1/forecast';

@lazySingleton
class WeatherApi {
  final Dio _dio;
  WeatherApi(this._dio);

  Future<GeocodingSearchResponseDto> searchCity(String cityName) async {
    final response = await _dio.get<Map<String, dynamic>>(
      kGeocodingSearchUrl,
      queryParameters: {'name': cityName, 'count': 1},
    );
    return GeocodingSearchResponseDto.fromJson(response.data!);
  }

  Future<WeatherForecastResponseDto> getCurrentWeather({
    required double latitude,
    required double longitude,
  }) async {
    final response = await _dio.get<Map<String, dynamic>>(
      kWeatherForecastUrl,
      queryParameters: {
        'latitude': latitude,
        'longitude': longitude,
        'current': 'temperature_2m,weather_code',
      },
    );
    return WeatherForecastResponseDto.fromJson(response.data!);
  }
}
