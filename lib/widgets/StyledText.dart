import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText(this.text, {super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}
//TODO: api istekleri api_service.dart dosyasında olmalı
//TODO: navigasyon işlemleri page dosyalarında olmalı
//TODO: hava ddurumunu getir butonuna tıklandığında verileri hive paketini kullanarak cihaza kaydet ve şehir seçme sayfasında son aratılan şehrin verisini göster
//: hive paketini pub dev e ekle, constant key oluştur ki veriyi hep onunla alıp kaydedeceksin
// ilk sayfaya girerken 