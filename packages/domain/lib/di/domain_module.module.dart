//@GeneratedMicroModule;DomainPackageModule;package:domain/di/domain_module.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'dart:async' as _i687;

import 'package:domain/domain.dart' as _i494;
import 'package:domain/usecase/get_current_weather_usecase.dart' as _i659;
import 'package:injectable/injectable.dart' as _i526;

class DomainPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    gh.factory<_i659.GetCurrentWeatherUseCase>(
        () => _i659.GetCurrentWeatherUseCase(gh<_i494.WeatherRepository>()));
  }
}
