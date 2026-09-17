import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_event.freezed.dart';

@freezed
sealed class WeatherEvent with _$WeatherEvent {
  const factory WeatherEvent.loadRequested(String cityName) =
      WeatherLoadRequested;
}
