import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../datasource/interceptor/connection_interceptor.dart';

@microPackageInit
void initDataModule() {}

@module
abstract class DataModule {
  @lazySingleton
  Dio get dio => Dio()
    ..interceptors.add(ConnectionInterceptor())
    ..interceptors.add(PrettyDioLogger(requestBody: true, responseBody: true));
}
