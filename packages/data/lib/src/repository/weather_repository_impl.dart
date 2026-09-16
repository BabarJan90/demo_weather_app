import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

import '../common/weather_code_mapper.dart';
import '../datasource/weather_api.dart';

@Singleton(as: WeatherRepository)
class WeatherRepositoryImpl extends WeatherRepository {
  final WeatherApi _api;

  WeatherRepositoryImpl(this._api);

  @override
  Future<Result<Weather>> getCurrentWeather(String cityName) async {
    try {
      final searchResponse = await _api.searchCity(cityName);

      if (searchResponse.results.isEmpty) {
        return Result.failed(Error.message('City "$cityName" not found'));
      }

      final location = searchResponse.results.first;
      final weatherResponse = await _api.getCurrentWeather(
        latitude: location.latitude,
        longitude: location.longitude,
      );

      return Result.success(
        Weather(
          cityName: location.name,
          temperatureCelsius: weatherResponse.current.temperature,
          description: WeatherCodeMapper.describe(
            weatherResponse.current.weatherCode,
          ),
        ),
      );
    } catch (e) {
      return Result.failed(Error.message('Failed to fetch weather: $e'));
    }
  }
}
