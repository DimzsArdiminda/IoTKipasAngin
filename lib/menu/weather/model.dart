class WeatherModel {
  WeatherModel({required this.currentWeather, required this.hourly});
  final Map<String, dynamic> currentWeather;
  final Map<String, dynamic> hourly;

  factory WeatherModel.fromJson(Map<String, dynamic> data) {
    final currentWeather = data['current_weather'] as Map<String, dynamic>;
    final hourly = data['hourly'] as Map<String, dynamic>;
    return WeatherModel(
      currentWeather: currentWeather,
      hourly: hourly,
    );
  }
}

class CurrentWeather {
  CurrentWeather({
    required this.temperature,
    required this.windspeed,
    required this.weatherCode,
    required this.winddirection,
    required this.isDay,
  });

  final double temperature;
  final double windspeed;
  final double winddirection;
  final int weatherCode;
  final int isDay;

  factory CurrentWeather.fromJson(Map<String, dynamic> data) {
    final double temperature = data['temperature_2m'] as double;
    final double windspeed = data['windspeed_10m'] as double;
    final double winddirection = data['winddirection_10m'] as double;
    final int weatherCode = data['weathercode'] as int;
    final int isDay = data['is_day'] as int;
    
    return CurrentWeather(
      temperature: temperature,
      windspeed: windspeed,
      weatherCode: weatherCode,
      winddirection: winddirection,
      isDay: isDay,
    );
  }
}

class HourlyCast {
  HourlyCast({
    required this.time,
    required this.temperature,
  });

  final List<String> time;
  final List<double> temperature;
}
