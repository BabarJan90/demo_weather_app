import 'package:equatable/equatable.dart';

class Weather extends Equatable {
  final String cityName;
  final double temperatureCelsius;
  final String description;

  const Weather({
    required this.description,
    required this.cityName,
    required this.temperatureCelsius,
  });

  @override
  List<Object?> get props => [cityName, temperatureCelsius, description];
}
