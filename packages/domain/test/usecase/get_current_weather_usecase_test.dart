import 'package:domain/domain.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockWeatherRepository extends Mock implements WeatherRepository {}

void main() {
  late GetCurrentWeatherUseCase usecase;
  late MockWeatherRepository mockRepository;

  setUp(() {
    mockRepository = MockWeatherRepository();
    usecase = GetCurrentWeatherUseCase(mockRepository);
  });

  const tCityName = 'London';
  const tWeather = Weather(
    cityName: tCityName,
    temperatureCelsius: 18.5,
    description: 'Clear sky',
  );

  test('given the repository succeeds, when call() runs, should return a successful Result', () async {
    when(() => mockRepository.getCurrentWeather(any()))
        .thenAnswer((_) async => Result.success(tWeather));

    final result = await usecase(tCityName);

    expect(result, equals(Result<Weather>.success(tWeather)));
    verify(() => mockRepository.getCurrentWeather(tCityName));
    verifyNoMoreInteractions(mockRepository);
  });

  test('given the repository fails, when call() runs, should return a failed Result', () async {
    const tError = Error.message('Something went wrong');
    when(() => mockRepository.getCurrentWeather(any()))
        .thenAnswer((_) async => Result.failed(tError));

    final result = await usecase(tCityName);

    expect(result, equals(Result<Weather>.failed(tError)));
  });
}
