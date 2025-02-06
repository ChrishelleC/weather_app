import 'package:flutter/material.dart';
import 'dart:math';


void main() {
  runApp(const WeatherInfoApp());
}


class WeatherInfoApp extends StatelessWidget {
  const WeatherInfoApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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


  String city = '';
  String temperature = '';
  String condition = '';
  List<Map<String, dynamic>> _forecast = [];


  void _fetchWeather() {
    // Create a function that simulates fetching weather data when the user clicks the "Fetch Weather" button.
    setState(() {
      city = _cityController.text; // Takes the entered city name
      temperature = '${15 + Random().nextInt(16)}°C'; // Generates a random temperature between 15 and 30 C.
      condition = ['Sunny', 'Cloudy', 'Rainy'][Random().nextInt(3)]; // Randomly select the weather condition.
    });
  }


  void _fetch7DayForecast() {
    // Create a function to simulate fetching weather data for a 7-day forecast.
    setState(() {
      _forecast = List.generate(7, (index) { // Generates a list of seven.
        final randomTemp = '${15 + Random().nextInt(16)}°C';
        final condition = ['Sunny', 'Cloudy', 'Rainy'][Random().nextInt(3)]; // Randomly select the weather condition.
        return {
          'day': 'Day ${index + 1}', // String interpolation for day labels.
          'temperature': randomTemp, // Temperature
          'condition': condition, // Condition
        };
      });
    });
  }


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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _fetchWeather,
                  child: const Text('Fetch Weather'), // Activity 2.b: Add a FlatButton or ElevatedButton labeled "Fetch Weather".
                ),
                ElevatedButton(
                  onPressed: _fetch7DayForecast,
                  child: const Text('7-Day Forecast'), // Activity 5: Add a button to retrieve a 7-day weather forecast.
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text('City: $city'), // Activity 2.c: Add placeholder for displaying weather data like city.
            // Activity 4: Show the entered city name
            Text('Temperature: $temperature'), // Temperature.
            // 4.2: Display the temperature
            Text('Condition: $condition'), // Weather condition.
            // 4.3: Display the weather condition.
            const SizedBox(height: 16),
            if (_forecast.isNotEmpty) ...[
              const Text(
                '7-Day Forecast:',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ..._forecast.map((dayForecast) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(dayForecast['day']), // Display day
                      Text('${dayForecast['temperature']} - ${dayForecast['condition']}'), // Display Temperature and condidtion.
                    ],
                  ),
                );
              }).toList(),
            ],
          ],
        ),
      ),
    );
  }
}
