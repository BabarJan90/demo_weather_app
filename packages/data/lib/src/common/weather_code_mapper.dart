class WeatherCodeMapper {
  const WeatherCodeMapper._();

  static String describe(int code) {
    switch (code) {
      case 0:
        return 'Clear sky';
      case 1:
      case 2:
      case 3:
        return 'Partly cloudy';
      case 45:
      case 48:
        return 'Fog';
      case 61:
      case 63:
      case 65:
        return 'Slight rain';
      case 71:
      case 73:
      case 75:
        return 'Snow fall';
      case 95:
        return 'Thunderstorm';
      default:
        return 'Unknown';
    }
  }
}
