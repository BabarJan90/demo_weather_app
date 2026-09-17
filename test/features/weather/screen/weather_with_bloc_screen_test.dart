import 'package:bloc_test/bloc_test.dart';
import 'package:demo_weather_app/features/weather/bloc/weather_bloc.dart';
import 'package:demo_weather_app/features/weather/bloc/weather_event.dart';
import 'package:demo_weather_app/features/weather/cubit/weather_state.dart';
import 'package:demo_weather_app/features/weather/screen/weather_with_bloc_screen.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockWeatherBloc extends MockBloc<WeatherEvent, WeatherState>
    implements WeatherBloc {}

void main() {
  late MockWeatherBloc mockBloc;

  setUpAll(() {
    registerFallbackValue(const WeatherState.initial());
    registerFallbackValue(const WeatherEvent.loadRequested(''));
  });

  setUp(() {
    mockBloc = MockWeatherBloc();
  });

  Widget buildSubject() {
    return BlocProvider<WeatherBloc>.value(
      value: mockBloc,
      child: const MaterialApp(home: WeatherWithBlocScreen()),
    );
  }

  testWidgets(
    'given a city name typed, when the button is tapped, should add WeatherLoadRequested',
    (tester) async {
      when(() => mockBloc.state).thenReturn(const WeatherState.initial());

      await tester.pumpWidget(buildSubject());
      await tester.enterText(find.byType(TextField), 'Paris');
      await tester.tap(find.byType(ElevatedButton));

      verify(() => mockBloc.add(const WeatherEvent.loadRequested('Paris')))
          .called(1);
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
      when(() => mockBloc.state).thenReturn(WeatherState.loaded(tWeather));

      await tester.pumpWidget(buildSubject());

      expect(find.text('London: 18.5°C, Clear sky'), findsOneWidget);
    },
  );
}
