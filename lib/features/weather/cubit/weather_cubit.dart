import 'package:domain/domain.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import 'weather_state.dart';

@injectable
class WeatherCubit extends Cubit<WeatherState> {
  final GetCurrentWeatherUseCase _getCurrentWeatherUseCase;

  WeatherCubit(this._getCurrentWeatherUseCase)
    : super(const WeatherState.initial());

  Future<void> load(String cityName) async {
    emit(const WeatherState.loading());

    final result = await _getCurrentWeatherUseCase(cityName);

    result.when(
      success: (weather) => emit(WeatherState.loaded(weather)),
      failed: (error) => emit(WeatherState.error(error.message)),
    );
  }
}
