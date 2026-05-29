import 'package:flutter/material.dart';

import 'database/prefrence_handler.dart';
import 'tugas10.dart';

class Halaman2 extends StatelessWidget {
  const Halaman2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Dashboard'),
        backgroundColor: Colors.pink,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await PreferenceHandler.logout();

              if (!context.mounted) return;

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Berhasil Logout'),
                  backgroundColor: Colors.green,
                ),
              );

              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const Tugas10Login(),
                ),
              );
            },
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Selamat Datang di Aplikasi LinkedIn!',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
