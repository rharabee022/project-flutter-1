import 'package:flutter/material.dart';

import 'tugas_11/login_screen.dart'; // Sesuaikan folder

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const KaeriApp());
}

class KaeriApp extends StatelessWidget {
  const KaeriApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kaeri Workspace',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFF1493)),
        useMaterial3: true,
      ),
      home: const LoginScreenKaeri(),
    );
  }
}
