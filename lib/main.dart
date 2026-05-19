import 'package:flutter/material.dart';
// 1. Ubah baris ini untuk memanggil file halaman_login.dart yang baru
import 'halaman_login.dart';

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
      // 2. Di sini perubahannya, panggil kelas LinkedInLoginPage dari file baru tersebut
      home: const LinkedInLoginPage(),
    );
  }
}
