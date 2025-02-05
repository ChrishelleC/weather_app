import 'package:flutter/material.dart';

void main() {
  runApp(const WeatherInfoApp());
}

class WeatherInfoApp extends StatelessWidget {
  const WeatherInfoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather Info App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const WeatherHomePage(),
    );
  }
}

class WeatherHomePage extends StatefulWidget {
  const WeatherHomePage({super.key});

  @override
  State<WeatherHomePage> createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Info App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _cityController,
              decoration: const InputDecoration(
                labelText: 'Enter City Name', // Activity 2.a: Button to input the City Name.
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Fetch Weather'),  // Activity 2.b: Add a FlatButton or ElevatedButton labeled "Fetch Weather".
            ),
            const SizedBox(height: 16),
            const Text('City: '),   // Activity2.c: Add placeholder for diplaying weather data like: city.
            const Text('Temperature: '), // Tempeture.
            const Text('Condition: '), // Weather condition.
          ],
        ),
      ),
    );
  }
}
