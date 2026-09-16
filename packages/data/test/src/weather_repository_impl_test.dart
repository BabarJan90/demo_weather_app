import 'package:data/src/datasource/weather_api.dart';
import 'package:data/src/dto/current_weather_dto.dart';
import 'package:data/src/dto/geocoding_result_dto.dart';
import 'package:data/src/dto/geocoding_search_response_dto.dart';
import 'package:data/src/dto/weather_forecast_response_dto.dart';
import 'package:data/src/repository/weather_repository_impl.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockWeatherApi extends Mock implements WeatherApi {}

void main() {
  late WeatherRepositoryImpl repository;
  late MockWeatherApi mockApi;

  setUp(() {
    mockApi = MockWeatherApi();
    repository = WeatherRepositoryImpl(mockApi);
  });

  const tCityName = 'London';

  test('given both API calls succeed, when getCurrentWeather() runs, should return a successful Result with mapped Weather', () async {
    when(() => mockApi.searchCity(tCityName)).thenAnswer(
      (_) async => const GeocodingSearchResponseDto(
        results: [
          GeocodingResultDto(name: 'London', latitude: 51.5, longitude: -0.11),
        ],
      ),
    );
    when(() => mockApi.getCurrentWeather(latitude: 51.5, longitude: -0.11))
        .thenAnswer(
          (_) async => const WeatherForecastResponseDto(
            current: CurrentWeatherDto(temperature: 18.5, weatherCode: 0),
          ),
        );

    final result = await repository.getCurrentWeather(tCityName);

    expect(
      result,
      equals(
        Result<Weather>.success(
          const Weather(
            cityName: 'London',
            temperatureCelsius: 18.5,
            description: 'Clear sky',
          ),
        ),
      ),
    );
  });

  test('given the geocoding API returns no results, when getCurrentWeather() runs, should return a failed Result', () async {
    when(() => mockApi.searchCity(tCityName))
        .thenAnswer((_) async => const GeocodingSearchResponseDto(results: []));

    final result = await repository.getCurrentWeather(tCityName);

    expect(result.isSuccess(), isFalse);
  });

  test('given the API throws, when getCurrentWeather() runs, should return a failed Result', () async {
    when(() => mockApi.searchCity(tCityName))
        .thenThrow(Exception('network error'));

    final result = await repository.getCurrentWeather(tCityName);

    expect(result.isSuccess(), isFalse);
  });
}
