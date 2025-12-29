import 'package:flutter/material.dart';
import 'package:hava_durumu_flutter/widgets/gradient_container.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../services/api_service.dart';
import 'weather_detail_screen.dart';

class WeatherSearchPage extends StatefulWidget {
  const WeatherSearchPage({super.key});

  @override
  State<WeatherSearchPage> createState() => _WeatherSearchPageState();
}

class _WeatherSearchPageState extends State<WeatherSearchPage> {
  final List<String> cities = [
    'Istanbul',
    'London',
    'Paris',
    'Berlin',
    'Tokyo',
    'Nassau',
  ];
  late String selectedCity;

  @override
  void initState() {
    super.initState();

    var box = Hive.box('settings');
    String? lastSavedCity = box.get('lastCity');

    selectedCity = lastSavedCity ?? cities[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Hava Durumu")),
      body: GradientContainer.blue(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Son Seçilen Şehir: $selectedCity",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              const Text("Lütfen Şehir Seçin"),
              DropdownButton<String>(
                value: selectedCity,
                items: cities.map((String city) {
                  return DropdownMenuItem<String>(
                    value: city,
                    child: Text(city),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  var box = Hive.box('settings');
                  box.put('lastCity', newValue);

                  setState(() {
                    selectedCity = newValue!;
                  });
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  getCityCoordinates(selectedCity, context);
                },
                child: const Text("Hava Durumunu Getir"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
