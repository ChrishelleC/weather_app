import 'package:flutter/material.dart';

void main() => runApp(const WeatherInfoApp());

class WeatherInfoApp extends StatelessWidget {
  const WeatherInfoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Info App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const WeatherHomePage(),
    );
  }
}

class WeatherHomePage extends StatelessWidget {
  const WeatherHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Info App'),
      ),
      body: const Center(
        child: Text('Welcome to the Weather Info App!'),
      ),
    );
  }
}
