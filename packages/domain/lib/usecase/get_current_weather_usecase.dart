import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCurrentWeatherUseCase extends UseCase {
  final WeatherRepository _repository;

  GetCurrentWeatherUseCase(this._repository);

  Future<Result<Weather>> call(String cityName) {
    return _repository.getCurrentWeather(cityName);
  }
}
