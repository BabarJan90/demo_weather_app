import 'package:bloc_test/bloc_test.dart';
import 'package:demo_weather_app/features/weather/bloc/weather_bloc.dart';
import 'package:demo_weather_app/features/weather/bloc/weather_event.dart';
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

  blocTest<WeatherBloc, WeatherState>(
    'given the use case succeeds, when WeatherLoadRequested is added, should emit [Loading, Loaded]',
    build: () {
      when(() => mockUseCase(tCityName))
          .thenAnswer((_) async => Result.success(tWeather));
      return WeatherBloc(mockUseCase);
    },
    act: (bloc) => bloc.add(const WeatherEvent.loadRequested(tCityName)),
    expect: () => [const WeatherState.loading(), WeatherState.loaded(tWeather)],
  );

  blocTest<WeatherBloc, WeatherState>(
    'given the use case fails, when WeatherLoadRequested is added, should emit [Loading, Error]',
    build: () {
      when(() => mockUseCase(tCityName))
          .thenAnswer((_) async => Result.failed(const Error.message('boom')));
      return WeatherBloc(mockUseCase);
    },
    act: (bloc) => bloc.add(const WeatherEvent.loadRequested(tCityName)),
    expect: () => [
      const WeatherState.loading(),
      const WeatherState.error('boom'),
    ],
  );
}
