import 'package:flutter/material.dart';
// 1. Ubah import-nya ke file tugas 5 kamu
import 'tugas5.dart';

void main() {
  runApp(const ChizilishiApp());
}

class ChizilishiApp extends StatelessWidget {
  const ChizilishiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Chizilishi App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
        useMaterial3: true,
      ),
      // 2. Memanggil class Utama dari Tugas 5
      home: const InteraktifPage(),
    );
  }
}
