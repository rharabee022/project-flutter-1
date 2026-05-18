import 'package:flutter/material.dart';

class ChizilishiApp extends StatelessWidget {
  const ChizilishiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas 2 Flutter - Profil Kompleks',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //  tema warna pink pastel
        scaffoldBackgroundColor: const Color(0xFFFFF0F5), // Lavender blush
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFFFB6C1), // Light pink
          foregroundColor: Colors.black87,
        ),
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // 1. Header (AppBar)
      appBar: AppBar(title: const Text('Detail Studio'), centerTitle: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // 2. Identitas Utama
              const Center(
                child: Text(
                  'Chizilishi Eyelash\nBeauty Studio',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF800020), // Warna bold/burgundy
                  ),
                ),
              ),

              const SizedBox(height: 30),

              // 3. Detail Kontak
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.pink.withValues(alpha: 0.1),
                      blurRadius: 8,
                    ),
                  ],
                ),
                child: const Row(
                  children: [
                    Icon(Icons.email_outlined, color: Colors.pink),
                    SizedBox(width: 12),
                    Text(
                      'hello@chizilishi.com',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 4. Informasi Pendukung
              Row(
                children: [
                  Icon(Icons.phone, size: 20, color: Colors.pink),
                  SizedBox(width: 8),
                  Text(
                    '0812-1223-4545',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  Icon(Icons.location_on, size: 20, color: Colors.pink),
                  SizedBox(width: 8),
                  Text(
                    'Jakarta Pusat',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // 5. Statistik Horizontal
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFD1DC),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Column(
                        children: [
                          Text(
                            '1000+',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text('Klien Puas', style: TextStyle(fontSize: 13)),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFD1DC),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Column(
                        children: [
                          Text(
                            '4.9/5',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text('Rating', style: TextStyle(fontSize: 13)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              // 6. Deskripsi Naratif
              Column(
                children: [
                  const SizedBox(height: 35),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      'Selamat datang di Chizilishi Eyelash Beauty Studio. Kami menghadirkan layanan kecantikan bulu mata premium dengan sentuhan kemewahan dan detail yang sempurna. Menggunakan material berkualitas tinggi untuk memberikan tampilan elegan, natural, dan proporsional bagi setiap klien kami.',
                      style: TextStyle(
                        fontSize: 14,
                        height: 1.6,
                        color: Colors.black87,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 40),

              // 7. LOGO
              Center(
                child: Container(
                  height: 170, // Tinggi area logo
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: const Color(0xFFFFB6C1),
                      width: 2,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Memanggil file gambar logo
                      Image.asset(
                        'assets/images/logo_chizilishi.png',
                        height: 130, // ukuran logo
                        fit: BoxFit.contain, //
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(
                            Icons.broken_image,
                            color: Colors.pink,
                            size: 90,
                          );
                        },
                      ),
                      const SizedBox(height: 1),
                      const Text(
                        'Premium Beauty Service',
                        style: TextStyle(
                          color: Colors.pink,
                          letterSpacing: 1,
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
