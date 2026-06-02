import 'package:flutter/material.dart';

import 'login_screen.dart';
import 'user_model.dart';

class HalamanProfil extends StatelessWidget {
  final UserModelSQL userData;
  const HalamanProfil({super.key, required this.userData});

  @override
  Widget build(BuildContext context) {
    const Color pinkFanta = Color(0xFFFF1493);

    return Scaffold(
      backgroundColor: const Color(0xFFFFFDD0),
      appBar: AppBar(
        title: const Text('Profil Saya'),
        backgroundColor: pinkFanta,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => const LoginScreenKaeri())),
          )
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            CircleAvatar(
                radius: 50,
                backgroundColor: pinkFanta.withValues(alpha: 0.1),
                child: const Icon(Icons.person, size: 50, color: pinkFanta)),
            const SizedBox(height: 16),
            Text(userData.nama,
                style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: pinkFanta),
                textAlign: TextAlign.center),
            const Text('Kaeri Member',
                style: TextStyle(fontSize: 15, color: Colors.grey)),
            const SizedBox(height: 42),
            _buildDetailRow(Icons.email_outlined, 'Email', userData.email),
            _buildDetailRow(Icons.phone_outlined, 'Nomor HP', userData.nomorHp),
            _buildDetailRow(
                Icons.location_city_outlined, 'Asal Kota', userData.asalKota),
            _buildDetailRow(Icons.lock_outline, 'Password', userData.password),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(IconData icon, String title, String value) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFFF1493)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(fontSize: 12, color: Colors.grey)),
                Text(value,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
