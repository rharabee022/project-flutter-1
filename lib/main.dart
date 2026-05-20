import 'package:flutter/material.dart';

// 1. Memanggil file tugas6.dart tempat halaman login LinkedIn berada
import 'tugas6.dart';

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
      // 2. Menampilkan LinkedInLoginPage sebagai halaman utama
      home: const LinkedInLoginPage(),
    );
  }
}
