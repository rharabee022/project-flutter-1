import 'package:flutter/material.dart';

class InteraktifPage extends StatefulWidget {
  const InteraktifPage({super.key});

  @override
  State<InteraktifPage> createState() => _InteraktifPageState();
}

class _InteraktifPageState extends State<InteraktifPage> {
  // 1. Toggle Teks Rahasia -> Catatan Admin
  bool _showSecretText = false;

  // 2. Ubah Warna -> Pin/Favoritkan Invoice
  bool _isFavorited = false;

  // 3. Deskripsi Tersembunyi -> Aturan Pembatalan MUA
  bool _showMoreInfo = false;

  // 5 & 6. Counter -> Slot Tambahan Asisten MUA
  int _counter = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Kaeri MUA Workspace',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        ),
        centerTitle: true,
        backgroundColor: Colors.pink.shade50,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Banner
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.pink.shade50.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  'Halo, Kak Karina Aespa! 👋\nKelola jadwal tim & invoice MUA jadi lebih mudah.',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.pink,
                  ),
                ),
              ),
              const SizedBox(height: 24),

              const Text(
                'Manajemen Studio (ElevatedButton)',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 8),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Aksi Utama Admin',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            _showSecretText = !_showSecretText;
                          });
                        },
                        icon: const Icon(Icons.security),
                        label: const Text('Buka Catatan Rahasia Admin'),
                      ),
                      if (_showSecretText) ...[
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.amber.shade50,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.amber.shade200),
                          ),
                          child: const Text(
                            'Halo, saya kuncen access!\nKode Brankas Kas Studio: 99X-Chizilishi',
                            style: TextStyle(
                              color: Colors.amber,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              const Text(
                'Sistem Invoice (IconButton & TextButton)',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 8),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Invoice #INV-2026-001\nKlien: Anya (Wedding Gold)',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          // ICON BUTTON (Warna)
                          IconButton(
                            icon: Icon(
                              Icons.bookmark,
                              color: _isFavorited
                                  ? Colors.pink
                                  : Colors.grey.shade400,
                              size: 28,
                            ),
                            onPressed: () {
                              setState(() {
                                _isFavorited = !_isFavorited;
                              });
                            },
                          ),
                        ],
                      ),
                      Text(
                        _isFavorited
                            ? 'Status: Invoice Prioritas Utama (Disukai!)'
                            : 'Status: Regular',
                        style: TextStyle(
                          color: _isFavorited ? Colors.pink : Colors.grey,
                          fontSize: 13,
                        ),
                      ),
                      const Divider(height: 24),
                      // TEXT BUTTON (Informasi selipan)
                      TextButton.icon(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.pink,
                        ),
                        onPressed: () {
                          setState(() {
                            _showMoreInfo = !_showMoreInfo;
                          });
                        },
                        icon: Icon(
                          _showMoreInfo ? Icons.expand_less : Icons.expand_more,
                        ),
                        label: const Text(
                          'Lihat Aturan Kebijakan Pembatalan MUA',
                        ),
                      ),
                      if (_showMoreInfo) ...[
                        const SizedBox(height: 8),
                        const Text(
                          'Kebijakan: DP tidak dapat dikembalikan jika pembatalan sepihak dilakukan H-7 acara.',
                          style: TextStyle(color: Colors.black, fontSize: 13),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // INKWELL
              const Text(
                'Kalender Tim & Jadwal (InkWell)',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 8),
              Card(
                clipBehavior: Clip
                    .antiAlias, // Properti splash gitu lah - biar efeknya keliatan di seluruh area card
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: InkWell(
                  onTap: () {
                    print('Sentuhan terdeteksi');
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text(
                          'Jadwal Ningning Anya diupdate: 15 Nov 2026, Tim B',
                        ),
                        duration: Duration(seconds: 1),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(16),
                    color: Colors.pink.shade50.withOpacity(0.3),
                    child: Row(
                      children: [
                        Container(width: 4, height: 40, color: Colors.pink),
                        const SizedBox(width: 12),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Jadwal Makeup: Akad Nikah Anya',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '15 November 2026 • Assigned: Tim B',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios,
                          size: 14,
                          color: Colors.black38,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // gesture detector yang di tap-tap, double tap, dan long press
              const Text(
                'Kebutuhan Tambahan Crew (GestureDetector)',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              const SizedBox(height: 8),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        'GestureDetector - Angka Slot Asisten: $_counter',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(height: 12),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _counter += 1;
                          });
                          print('Ditekan sekali');
                        },
                        onDoubleTap: () {
                          setState(() {
                            _counter += 2;
                          });
                          print('Ditekan dua kali');
                        },
                        onLongPress: () {
                          setState(() {
                            _counter += 3;
                          });
                          print('Tahan lama');
                        },
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.blue.shade100),
                          ),
                          child: const Center(
                            child: Text(
                              '[Ketuk Kotak Ini untuk Atur Slot Crew]\n1x Tap (+1) | 2x Tap (+2) | Tahan Lama (+3)',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),

      // tombol ngambang
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _counter--;
          });
        },
        backgroundColor: Colors.pink,
        foregroundColor: Colors.white,
        tooltip: 'Kurangi Slot Crew',
        child: const Icon(Icons.remove),
      ),
    );
  }
}
