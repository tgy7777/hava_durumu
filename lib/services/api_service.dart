import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../pages/weather_detail_screen.dart';

Future<void> getCityCoordinates(String cityName, BuildContext context) async {
  final apiUrl =
      'http://api.openweathermap.org/geo/1.0/direct?q=$cityName&limit=1&appid=56ed2fdbc9079c234c5ca475fcacc924';

  try {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final List data = json.decode(response.body);
      if (data.isNotEmpty) {
        final double lat = data[0]['lat'];
        final double lon = data[0]['lon'];

        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                WeatherDetailScreen(lat: lat, lon: lon, cityName: cityName),
          ),
        );
      }
    }
  } catch (e) {
    print('Hata: $e');
  }
}
