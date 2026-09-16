import 'package:domain/common/result.dart';
import 'package:domain/model/Weather.dart';

abstract class WeatherRepository {
  Future<Result<Weather>> getCurrentWeather(String city);
}
