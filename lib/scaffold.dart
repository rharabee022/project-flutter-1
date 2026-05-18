import 'package:flutter/material.dart';

class Scaffold5 extends StatelessWidget {
  const Scaffold5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profil Saya"),
        backgroundColor: const Color.fromARGB(255, 223, 205, 238),
      ),

      body: const Column(
        children: [
          SizedBox(height: 20),
          Text(
            "Nama: Tatjana Bella",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.pink, 
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on),
              Text("Jakarta Pusat Kemayoran"),
            ],
          ),

          Text(
            "Perempuan asal bandung, beauty content creator",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
