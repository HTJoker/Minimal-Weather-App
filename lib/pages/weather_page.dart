import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/services/weather_service.dart';
import 'package:weather_app/theme/theme.dart';
import 'package:weather_app/theme/theme_provider.dart';

import '../models/weather_model.dart';

class WeatherPage extends StatefulWidget {
  const WeatherPage({super.key});

  @override
  State<WeatherPage> createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  final _weatherService = WeatherService('6caaaecdcaab5974e9dcabbf93bf96ca');
  Weather? _weather;

  fetchWeather() async {
    String cityName = await _weatherService.getCurrentCity();
    try {
      final weather = await _weatherService.getWeather(cityName);
      setState(() {
        _weather = weather;
      });
    } catch (e) {
      print(e);
    }
  }

  String getWeatherIcon(String? mainCondition) {
    if (mainCondition == null) return "assets/sunny.json";

    switch (mainCondition.toLowerCase()) {
      case "clouds":
      case "mist":
      case "smoke":
      case "haze":
      case "dust":
      case "fog":
        return "assets/cloudy.json";
      case "rain":
      case "drizzle":
      case 'shower rain':
        return "assets/rainy.json";
      case "thinderstorm":
        return "assets/thunder.json";
      default:
        return "assets/sunny.json";
    }
  }

  @override
  void initState() {
    super.initState();
    fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _weather?.cityName ?? "loading city...",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.grey[700]),
            ),
            Lottie.asset(getWeatherIcon(_weather?.mainCondition)),
            Text(
              "${_weather?.temperature.round()}°C",
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
        },
        child: Provider.of<ThemeProvider>(context).currentTheme == lightMode
            ? const Icon(Icons.nightlight_round_sharp)
            : const Icon(Icons.wb_sunny),
      ),
    );
  }
}
