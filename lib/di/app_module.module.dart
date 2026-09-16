//@GeneratedMicroModule;DemoWeatherAppPackageModule;package:demo_weather_app/di/app_module.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'dart:async' as _i687;

import 'package:demo_weather_app/features/weather/cubit/weather_cubit.dart'
    as _i1061;
import 'package:domain/domain.dart' as _i494;
import 'package:injectable/injectable.dart' as _i526;

class DemoWeatherAppPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.factory<_i1061.WeatherCubit>(
        () => _i1061.WeatherCubit(gh<_i494.GetCurrentWeatherUseCase>()));
  }
}
