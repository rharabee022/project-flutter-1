import 'package:flutter/material.dart';

import 'database/prefrence_handler.dart';
import 'tugas10.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceHandler.init();

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
      home: const Tugas10Login(),
    );
  }
}
