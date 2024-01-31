class Weather {
  final String cityName;
  final double temperature;
  final String mainCondition;
  final double feelsLike;
  final int humidity;

  Weather({
    required this.cityName,
    required this.temperature,
    required this.mainCondition,
    required this.feelsLike,
    required this.humidity,
  });

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      cityName: json['name'],
      temperature: json['main']['temp'].toDouble(),
      mainCondition: json['weather'][0]['main'],
      feelsLike: json['main']['feels_like'].toDouble(),
      humidity: json['main']['humidity'],
    );
  }
}
