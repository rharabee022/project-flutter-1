import 'package:flutter/material.dart';

//MODEL CLASS
class MakeupService {
  final String serviceName;
  final String description;
  final String assetPath;

  MakeupService({
    required this.serviceName,
    required this.description,
    required this.assetPath,
  });
}

class Tugas9Screen extends StatelessWidget {
  const Tugas9Screen({super.key});

  @override
  Widget build(BuildContext context) {
    // Nama Tipe/Jenis Makeup

    final List<String> servicesLevel1 = [
      'Wedding Makeup',
      'Pre-Wedding Makeup',
      'Party / Event Makeup',
      'Graduation (Wisuda) Makeup',
      'Engagement Makeup',
      'Photoshoot / Editorial',
      'Daily / Natural Look',
      'Stage / Performance Makeup',
      'Traditional / Adat Makeup',
      'Eyelash Extension & Lift'
    ];

    // LEVEL 2 DATA: List of Map (Nama Layanan & Ikon Pendukung)

    final List<Map<String, dynamic>> servicesLevel2 = [
      {'name': 'Wedding Makeup', 'icon': Icons.favorite},
      {'name': 'Pre-Wedding Makeup', 'icon': Icons.camera_roll},
      {'name': 'Party / Event Makeup', 'icon': Icons.nightlife},
      {'name': 'Graduation (Wisuda) Makeup', 'icon': Icons.school},
      {'name': 'Engagement Makeup', 'icon': Icons.diamond},
      {'name': 'Photoshoot / Editorial', 'icon': Icons.camera_alt},
      {'name': 'Daily / Natural Look', 'icon': Icons.face},
      {'name': 'Stage / Performance Makeup', 'icon': Icons.auto_awesome},
      {'name': 'Traditional / Adat Makeup', 'icon': Icons.brightness_7},
      {'name': 'Eyelash Extension & Lift', 'icon': Icons.remove_red_eye},
    ];

    // LEVEL 3 DATA: List of Object Model (Menggunakan Gambar Aset Lokal)
    final List<MakeupService> makeupServices = [
      MakeupService(
        serviceName: 'Flawless Wedding Makeup',
        description:
            'Riasan pengantin premium yang tahan lama, manglingi, dan camera-ready sepanjang hari.',
        assetPath: 'assets/images/wedding.jpg', // cari file namanya wedding.jpg
      ),
      MakeupService(
        serviceName: 'Pre-Wedding Cinematic Look',
        description:
            'Makeup khusus foto/video outdoor maupun indoor dengan ketahanan tinggi terhadap cuaca.',
        assetPath:
            'assets/images/prewedding.jpg', // cari file namanya prewedding.jpg
      ),
      MakeupService(
        serviceName: 'Glamour Party Makeup',
        description:
            'Tampilan bold atau glam untuk menghadiri pesta, gala dinner, maupun acara formal malam hari.',
        assetPath: 'assets/images/party.jpg', // cari file namanya party.jpg
      ),
      MakeupService(
        serviceName: 'Graduation (Wisuda) Fresh Look',
        description:
            'Riasan segar, awet muda, dan bebas minyak (matte) untuk momen kelulusanmu.',
        assetPath:
            'assets/images/graduation.jpg', // cari file namanya graduation.jpg
      ),
      MakeupService(
        serviceName: 'Elegant Engagement Makeup',
        description:
            'Makeup soft glam yang memancarkan aura anggun di hari pertunangan atau lamaran.',
        assetPath:
            'assets/images/engagement.jpg', // cari file namanya engagement.jpg
      ),
      MakeupService(
        serviceName: 'Editorial & Fashion Photoshoot',
        description:
            'Makeup konseptual berestetika tinggi untuk kebutuhan komersial, majalah, atau portofolio.',
        assetPath:
            'assets/images/photoshoot.jpg', // cari file namanya photoshoot.jpg
      ),
      MakeupService(
        serviceName: 'Daily / No-Makeup Look',
        description:
            'Riasan super natural yang mempertegas fitur wajah asli untuk acara santai sehari-hari.',
        assetPath: 'assets/images/daily.jpg', // cari file namanya daily.jpg
      ),
      MakeupService(
        serviceName: 'Stage & Performance Makeup',
        description:
            'Makeup dengan pigmentasi kontras tinggi agar wajah tetap berkarakter di bawah lampu panggung.',
        assetPath: 'assets/images/stage.jpg', // cari file namanya stage.jpg
      ),
      MakeupService(
        serviceName: 'Traditional Adat Makeup',
        description:
            'Riasan pakem pengantin adat Nusantara (Jawa, Sunda, Minang, dll) yang anggun dan sakral.',
        assetPath: 'assets/images/adat.jpg', // cari file namanya adat.jpg
      ),
      MakeupService(
        serviceName: 'Studio Eyelash & Brow Lift',
        description:
            'Treatment pelengkap untuk menyempurnakan bentuk alis dan bulu mata agar mata terlihat hidup.',
        assetPath: 'assets/images/eyelash.jpg', // cari file namanya eyelash.jpg
      ),
    ];

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('MUA Service Menu'),
          backgroundColor: Colors.pink[300],
          bottom: const TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'Level 1\n(Tipe Makeup)'),
              Tab(text: 'Level 2\n(Dengan Ikon)'),
              Tab(text: 'Level 3\n(Katalog Jasa)'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            // List Sederhana

            ListView.builder(
              itemCount: servicesLevel1.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(servicesLevel1[index]),
                  trailing: const Icon(Icons.keyboard_arrow_right,
                      color: Colors.grey),
                );
              },
            ),

            // List of Map

            ListView.builder(
              itemCount: servicesLevel2.length,
              itemBuilder: (context, index) {
                final item = servicesLevel2[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.pink[50],
                    child: Icon(item['icon'], color: Colors.pink[300]),
                  ),
                  title: Text(item['name']),
                  trailing:
                      const Icon(Icons.bookmark_border, color: Colors.pink),
                );
              },
            ),

            // UI LEVEL 3: Pendekatan Model (Professional Level)

            ListView.builder(
              padding: const EdgeInsets.all(12),
              itemCount: makeupServices.length,
              itemBuilder: (context, index) {
                // Custom Widget
                return ServiceCardItem(service: makeupServices[index]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

// Custom widget

class ServiceCardItem extends StatelessWidget {
  final MakeupService service;

  const ServiceCardItem({super.key, required this.service});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gambar Layanan dari Aset Lokal (Folder Proyek)
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
            child: Image.asset(
              service.assetPath, // manggil path lokal dari model data
              width: double.infinity,
              height: 160,
              fit: BoxFit.cover,
              // kalo gambar belum diunduh / tidak ditemukan, tampilkan placeholder abu-abu agar tidak error crashs
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: double.infinity,
                  height: 160,
                  color: Colors.grey[200],
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image_not_supported,
                          color: Colors.grey, size: 40),
                      SizedBox(height: 4),
                      Text(
                        'Gambar belum dimasukkan ke folder assets',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          // Detail Layanan di bawah Gambar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  service.serviceName,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  service.description,
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.grey[600],
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.calendar_month, size: 16),
                    label: const Text('Book Now'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pink[300],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
