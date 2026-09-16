import 'package:bloc_test/bloc_test.dart';
import 'package:demo_weather_app/features/weather/cubit/weather_cubit.dart';
import 'package:demo_weather_app/features/weather/cubit/weather_state.dart';
import 'package:demo_weather_app/features/weather/screen/weather_screen.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockWeatherCubit extends MockCubit<WeatherState>
    implements WeatherCubit {}

void main() {
  late MockWeatherCubit mockCubit;

  setUpAll(() {
    registerFallbackValue(WeatherInitial());
  });

  setUp(() {
    mockCubit = MockWeatherCubit();
  });

  Widget buildSubject() {
    return BlocProvider<WeatherCubit>.value(
      value: mockCubit,
      child: const MaterialApp(home: WeatherScreen()),
    );
  }

  testWidgets(
    'given WeatherInitial, when the screen builds, should show the prompt text',
    (tester) async {
      when(() => mockCubit.state)
          .thenReturn(const WeatherState.initial()); // was WeatherInitial()
      await tester.pumpWidget(buildSubject());

      expect(find.text('Enter a city to get started'), findsOneWidget);
    },
  );

  testWidgets(
    'given WeatherLoading, when the screen builds, should show a spinner',
    (tester) async {
      when(() => mockCubit.state).thenReturn(const WeatherState.loading());

      await tester.pumpWidget(buildSubject());

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    },
  );

  testWidgets(
    'given WeatherLoaded, when the screen builds, should show the weather text',
    (tester) async {
      const tWeather = Weather(
        cityName: 'London',
        temperatureCelsius: 18.5,
        description: 'Clear sky',
      );
      when(() => mockCubit.state).thenReturn(WeatherState.loaded(tWeather));

      await tester.pumpWidget(buildSubject());

      expect(find.text('London: 18.5°C, Clear sky'), findsOneWidget);
    },
  );

  testWidgets(
    'given a city name typed, when the button is tapped, should call load()',
    (tester) async {
      when(() => mockCubit.state).thenReturn(WeatherInitial());
      when(() => mockCubit.load(any())).thenAnswer((_) async {});

      await tester.pumpWidget(buildSubject());
      await tester.enterText(find.byType(TextField), 'Paris');
      await tester.tap(find.byType(ElevatedButton));

      verify(() => mockCubit.load('Paris')).called(1);
    },
  );
}
