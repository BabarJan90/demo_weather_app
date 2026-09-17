import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../cubit/weather_state.dart';
import 'weather_event.dart';

@injectable
class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final GetCurrentWeatherUseCase _getCurrentWeatherUseCase;

  WeatherBloc(this._getCurrentWeatherUseCase)
    : super(const WeatherState.initial()) {
    on<WeatherLoadRequested>(_onLoadRequested);
  }

  Future<void> _onLoadRequested(
    WeatherLoadRequested event,
    Emitter<WeatherState> emit,
  ) async {
    emit(const WeatherState.loading());

    final result = await _getCurrentWeatherUseCase(event.cityName);

    result.when(
      success: (weather) => emit(WeatherState.loaded(weather)),
      failed: (error) => emit(WeatherState.error(error.message)),
    );
  }
}
