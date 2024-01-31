import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'pages/weather_page.dart';
import 'theme/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      home: const WeatherPage(),
    );
  }
}
