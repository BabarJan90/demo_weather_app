import 'package:bloc_test/bloc_test.dart';
import 'package:demo_weather_app/features/weather/cubit/weather_cubit.dart';
import 'package:demo_weather_app/features/weather/cubit/weather_state.dart';
import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetCurrentWeatherUseCase extends Mock
    implements GetCurrentWeatherUseCase {}

void main() {
  late MockGetCurrentWeatherUseCase mockUseCase;

  setUp(() {
    mockUseCase = MockGetCurrentWeatherUseCase();
  });

  const tCityName = 'London';
  const tWeather = Weather(
    cityName: tCityName,
    temperatureCelsius: 18.5,
    description: 'Clear sky',
  );
  blocTest<WeatherCubit, WeatherState>(
    'given the use case succeeds, when load() runs, should emit [Loading, Loaded]',
    build: () {
      when(() => mockUseCase(tCityName))
          .thenAnswer((_) async => Result.success(tWeather));
      return WeatherCubit(mockUseCase);
    },
    act: (cubit) => cubit.load(tCityName),
    expect: () => [const WeatherState.loading(), WeatherState.loaded(tWeather)],
  );

  blocTest<WeatherCubit, WeatherState>(
    'given the use case fails, when load() runs, should emit [Loading, Error]',
    build: () {
      when(() => mockUseCase(tCityName))
          .thenAnswer((_) async => Result.failed(const Error.message('boom')));
      return WeatherCubit(mockUseCase);
    },
    act: (cubit) => cubit.load(tCityName),
    expect: () => [
      const WeatherState.loading(),
      const WeatherState.error('boom'),
    ],
  );
}
