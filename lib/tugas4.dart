import 'package:flutter/material.dart';

class Tugas4 extends StatelessWidget {
  const Tugas4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //APPBAR
      appBar: AppBar(
        title: const Text('Rumah Sakit Meong Jakarta'),
        backgroundColor: const Color.fromARGB(80, 173, 83, 151),
      ),

      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const Text(
            "Registrasi Pasien Baru",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 15),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Nama Pemilik',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Nama Kucing',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          const TextField(
            decoration: InputDecoration(
              labelText: 'No WhatsApp',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 10),
          const TextField(
            decoration: InputDecoration(
              labelText: 'Keluhan',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 30),

          const Text(
            "Daftar Antrean Pasien",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Divider(),

          const ListTile(
            leading: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 253, 45, 160),
              child: Icon(Icons.pets, color: Colors.white),
            ),
            title: Text('Oreo'),
            subtitle: Text('Pemilik: Ira - Status: Menunggu'),
          ),
          const ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.orange,
              child: Icon(Icons.pets, color: Colors.white),
            ),
            title: Text('Mochi'),
            subtitle: Text('Pemilik: Zacky - Status: Diperiksa'),
          ),
          const ListTile(
            leading: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 130, 241, 120),
              child: Icon(Icons.pets, color: Colors.white),
            ),
            title: Text('Luna'),
            subtitle: Text('Pemilik: Rara - Status: Selesai'),
          ),
          const ListTile(
            leading: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 43, 183, 238),
              child: Icon(Icons.pets, color: Colors.white),
            ),
            title: Text('Simba'),
            subtitle: Text('Pemilik: Abdur - Status: Menunggu'),
          ),
          const ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.brown,
              child: Icon(Icons.pets, color: Colors.white),
            ),
            title: Text('Boba'),
            subtitle: Text('Pemilik: Rafi - Status: Menunggu'),
          ),

          const ListTile(
            leading: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 170, 154, 230),
              child: Icon(Icons.pets, color: Colors.white),
            ),
            title: Text('Rendang'),
            subtitle: Text('Pemilik: Jaenab - Status: Menunggu'),
          ),

          const ListTile(
            leading: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 240, 29, 29),
              child: Icon(Icons.pets, color: Colors.white),
            ),
            title: Text('Maxi'),
            subtitle: Text('Pemilik: Donghae - Status: Menunggu'),
          ),

          const ListTile(
            leading: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 130, 228, 228),
              child: Icon(Icons.pets, color: Colors.white),
            ),
            title: Text('Chihua'),
            subtitle: Text('Pemilik: Ningning - Status: Menunggu'),
          ),

          const ListTile(
            leading: CircleAvatar(
              backgroundColor: Color.fromARGB(255, 231, 174, 108),
              child: Icon(Icons.pets, color: Colors.white),
            ),
            title: Text('Ramen'),
            subtitle: Text('Pemilik: Reynaldi - Status: Menunggu'),
          ),
        ],
      ),
    );
  }
}
