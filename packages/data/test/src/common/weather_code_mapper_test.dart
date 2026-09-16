import 'package:data/src/common/weather_code_mapper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('WeatherCodeMapper', () {
    test('given code 0, when describe() runs, should return Clear sky', () {
      expect(WeatherCodeMapper.describe(0), 'Clear sky');
    });

    test('given code 61, when describe() runs, should return Slight rain', () {
      expect(WeatherCodeMapper.describe(61), 'Slight rain');
    });

    test(
      'given an unknown code, when describe() runs, should return Unknown',
      () {
        expect(WeatherCodeMapper.describe(9999), 'Unknown');
      },
    );
  });
}
