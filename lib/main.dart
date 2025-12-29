import 'package:flutter/material.dart';
import 'package:hava_durumu_flutter/pages/city_selection_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // widget sistemi ile cihaz (Native platform) arasındaki bağı kurarmış. Eğer main içinde runApp'ten önce herhangi bir asenkron işlem (Hive, Firebase vb.) yapacaksanız, bu satırı yazmak zorunluluğunuz vardır. Aksi takdirde uygulama hata verir.
  await Hive.initFlutter();
  await Hive.openBox('settings');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: const WeatherSearchPage()),
      //  child: Center(child: WeatherSearch()),
    );
  }
}
