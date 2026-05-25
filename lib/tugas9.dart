import 'package:flutter/material.dart';

//Model Class

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
    // data layanan

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

    final List<MakeupService> makeupServices = [
      MakeupService(
          serviceName: 'Wedding Makeup',
          description: 'Riasan pengantin, look internasional',
          assetPath: 'assets/images/wedding.jpg'),
      MakeupService(
          serviceName: 'Pre-Wedding Look',
          description: 'Makeup khusus foto outdoor/indoor tahan cuaca.',
          assetPath: 'assets/images/prewedding.jpg'),
      MakeupService(
          serviceName: 'Glamour Party',
          description: 'Tampilan bold atau glam untuk menghadiri pesta formal.',
          assetPath: 'assets/images/party.jpg'),
      MakeupService(
          serviceName: 'Graduation Fresh',
          description:
              'Riasan segar, awet muda, dan bebas minyak untuk wisuda.',
          assetPath: 'assets/images/graduation.jpg'),
      MakeupService(
          serviceName: 'Elegant Engagement',
          description: 'Makeup soft glam anggun di hari lamaran pernikahan.',
          assetPath: 'assets/images/engagement.jpg'),
      MakeupService(
          serviceName: 'Editorial Fashion',
          description: 'Makeup konseptual estetika tinggi untuk photoshoot.',
          assetPath: 'assets/images/photoshoot.jpg'),
      MakeupService(
          serviceName: 'Daily Natural Look',
          description: 'Riasan super natural mempertegas fitur wajah asli.',
          assetPath: 'assets/images/daily.jpg'),
      MakeupService(
          serviceName: 'Stage Performance',
          description:
              'Makeup pigmentasi kontras tinggi untuk sorot lampu panggung.',
          assetPath: 'assets/images/stage.jpg'),
      MakeupService(
          serviceName: 'Traditional Adat',
          description: 'Riasan pakem pengantin adat Nusantara yang sakral.',
          assetPath: 'assets/images/adat.jpg'),
      MakeupService(
          serviceName: 'Eyelash Studio',
          description: 'Treatment bulu mata agar mata terlihat lebih hidup.',
          assetPath: 'assets/images/eyelash.jpg'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Kaeri Dashboard Menu',
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        backgroundColor: Colors.pink[300],
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Tipe Makeup

          Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.pink[100]!, width: 1.5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Judul di dalam kotak
                Row(
                  children: [
                    Icon(Icons.stars, color: Colors.pink[400]),
                    const SizedBox(width: 8),
                    const Text(
                      'Tipe Layanan Makeup',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // List Horizontal
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: servicesLevel1.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(10),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.pink[50],
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          servicesLevel1[index],
                          style: TextStyle(
                              color: Colors.pink[700],
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // LEVEL 2
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.pink[100]!, width: 1.5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title / Judul di dalam kotak
                Row(
                  children: [
                    Icon(Icons.check_circle, color: Colors.pink[400]),
                    const SizedBox(width: 8),
                    const Text(
                      'Checklist Booking',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // List Horizontal
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: servicesLevel2.length,
                    itemBuilder: (context, index) {
                      final item = servicesLevel2[index];
                      return Container(
                        width: 180,
                        margin: const EdgeInsets.only(right: 10),
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.grey[50],
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey[200]!),
                        ),
                        child: Row(
                          children: [
                            Icon(item['icon'],
                                color: Colors.pink[300], size: 18),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                item['name'],
                                style: const TextStyle(
                                    fontSize: 11, fontWeight: FontWeight.w500),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          // Level 3: Katalog
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.pink[100]!, width: 1.5),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title / Judul di dalam kotak
                Row(
                  children: [
                    Icon(Icons.collections, color: Colors.pink[400]),
                    const SizedBox(width: 8),
                    const Text(
                      'Katalog Foto & Detail Jasa',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                // List Horizontal Kartu Gambar
                SizedBox(
                  height: 240,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: makeupServices.length,
                    itemBuilder: (context, index) {
                      final service = makeupServices[index];
                      return Container(
                        width: 150,
                        margin: const EdgeInsets.only(right: 12),
                        child: Card(
                          elevation: 2,
                          margin: EdgeInsets.zero,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 12),
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12)),
                                child: Image.asset(
                                  service.assetPath,
                                  width: double.infinity,
                                  height: 100,
                                  fit: BoxFit.fitHeight,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      width: double.infinity,
                                      height: 100,
                                      color: Colors.grey[200],
                                      child: const Icon(
                                          Icons.image_not_supported,
                                          color: Colors.grey),
                                    );
                                  },
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        service.serviceName,
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        service.description,
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[600],
                                            height: 1.2),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      const Spacer(),
                                      SizedBox(
                                        width: double.infinity,
                                        height: 24,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.pink[300],
                                            foregroundColor: Colors.white,
                                            padding: EdgeInsets.zero,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6)),
                                          ),
                                          child: const Text('Book',
                                              style: TextStyle(fontSize: 10)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
