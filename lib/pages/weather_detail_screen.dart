import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class WeatherDetailScreen extends StatefulWidget {
  final double lat;
  final double lon;
  final String cityName;

  const WeatherDetailScreen({
    super.key,
    required this.lat,
    required this.lon,
    required this.cityName,
  });

  @override
  State<WeatherDetailScreen> createState() => _WeatherDetailScreenState();
}

class _WeatherDetailScreenState extends State<WeatherDetailScreen> {
  Map<String, dynamic>? weatherData;

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  Future<void> fetchWeatherData() async {
    final url =
        'https://api.openweathermap.org/data/2.5/weather?lat=${widget.lat}&lon=${widget.lon}&appid=56ed2fdbc9079c234c5ca475fcacc924&units=metric';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        setState(() {
          weatherData = json.decode(response.body);
        });
      }
    } catch (e) {
      print("Hata: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.cityName)),
      body: weatherData == null
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${weatherData!['main']['temp'].round()}°C",
                    style: const TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    weatherData!['weather'][0]['description'].toUpperCase(),
                    style: const TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 20),
                  Text("Nem: %${weatherData!['main']['humidity']}"),
                  Text("Rüzgar: ${weatherData!['wind']['speed']} m/s"),
                ],
              ),
            ),
    );
  }
}
