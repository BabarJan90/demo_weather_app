//@GeneratedMicroModule;DataPackageModule;package:data/src/di/data_module.module.dart
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'dart:async' as _i687;

import 'package:data/src/datasource/weather_api.dart' as _i312;
import 'package:data/src/di/data_module.dart' as _i797;
import 'package:data/src/repository/weather_repository_impl.dart' as _i678;
import 'package:dio/dio.dart' as _i361;
import 'package:domain/domain.dart' as _i494;
import 'package:injectable/injectable.dart' as _i526;

class DataPackageModule extends _i526.MicroPackageModule {
// initializes the registration of main-scope dependencies inside of GetIt
  @override
  _i687.FutureOr<void> init(_i526.GetItHelper gh) {
    final dataModule = _$DataModule();
    gh.lazySingleton<_i361.Dio>(() => dataModule.dio);
    gh.lazySingleton<_i312.WeatherApi>(() => _i312.WeatherApi(gh<_i361.Dio>()));
    gh.singleton<_i494.WeatherRepository>(
        () => _i678.WeatherRepositoryImpl(gh<_i312.WeatherApi>()));
  }
}

class _$DataModule extends _i797.DataModule {}
