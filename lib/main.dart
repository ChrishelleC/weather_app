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


  void _fetchWeather(){ // Create a function that simulates fetching weather data when the user clicks the
// "Fetch Weather" button.
    setState(() {
      city = _cityController.text; // Takes the entered city name
      temperature = '${15 + Random().nextInt(16)}°C'; // Generates a random temperature between 15 and 30 C.
      condition = ['Sunny', 'Cloudy','Rainy'][Random().nextInt(3)]; // Randomly select the weather condition.
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
            ElevatedButton(
              onPressed: _fetchWeather,
              child: const Text('Fetch Weather'),  // Activity 2.b: Add a FlatButton or ElevatedButton labeled "Fetch Weather".
            ),
            const SizedBox(height: 16),
             Text('City: $city'),   // Activity2.c: Add placeholder for diplaying weather data like: city.
             // Activity 4: show the entered city name
             Text('Temperature: $temperature'), // Tempeture.
             // 4.2: Display the temperature
             Text('Condition: $condition'), // Weather condition.
             // 4.3: display the weather condition.
          ],
        ),
      ),
    );
  }
}
