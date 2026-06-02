import 'package:flutter/material.dart';

import 'db_helper.dart';
import 'user_model.dart';

class HalamanPendaftaran extends StatefulWidget {
  const HalamanPendaftaran({super.key});

  @override
  State<HalamanPendaftaran> createState() => _HalamanPendaftaranState();
}

class _HalamanPendaftaranState extends State<HalamanPendaftaran> {
  final _formKey = GlobalKey<FormState>();

  // Controller
  final namaController = TextEditingController();
  final emailController = TextEditingController();
  final hpController = TextEditingController();
  final kotaController = TextEditingController();
  final passwordController = TextEditingController();

  late Future<List<UserModelSQL>> _futurePeserta;

  final Color pinkFanta = const Color(0xFFFF1493);
  bool _isPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _refreshList(); // Memuat data awal
  }

  void _refreshList() {
    setState(() {
      _futurePeserta = DBHelper().getAllPeserta();
    });
  }

  void _simpanData() async {
    if (_formKey.currentState!.validate()) {
      final pesertaBaru = UserModelSQL(
        nama: namaController.text.trim(),
        email: emailController.text.trim(),
        nomorHp: hpController.text.trim(),
        asalKota: kotaController.text.trim(),
        password: passwordController.text,
      );

      bool sukses = await DBHelper().registerUser(pesertaBaru);

      if (sukses) {
        namaController.clear();
        emailController.clear();
        hpController.clear();
        kotaController.clear();
        passwordController.clear();

        _refreshList();
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: const Text('Data berhasil disimpan! ✨'),
              backgroundColor: pinkFanta),
        );
      } else {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Gagal! Email mungkin sudah dipakai. ❌'),
              backgroundColor: Colors.redAccent),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFDD0),
      appBar: AppBar(
        title: const Text('Dashboard Member Kaeri'),
        backgroundColor: pinkFanta,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24)),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: namaController,
                    decoration: InputDecoration(
                        labelText: 'Nama Lengkap',
                        prefixIcon: const Icon(Icons.person),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                    validator: (value) => value == null || value.isEmpty
                        ? 'Nama wajib diisi'
                        : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: const Icon(Icons.email),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                    validator: (value) => value == null || value.isEmpty
                        ? 'Email wajib diisi'
                        : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: hpController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                        labelText: 'Nomor HP',
                        prefixIcon: const Icon(Icons.phone),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                    validator: (value) => value == null || value.isEmpty
                        ? 'HP wajib diisi'
                        : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: kotaController,
                    decoration: InputDecoration(
                        labelText: 'Asal Kota',
                        prefixIcon: const Icon(Icons.location_city),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12))),
                    validator: (value) => value == null || value.isEmpty
                        ? 'Kota wajib diisi'
                        : null,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        prefixIcon: const Icon(Icons.lock),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12)),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.grey,
                          ),
                          onPressed: () => setState(
                              () => _isPasswordVisible = !_isPasswordVisible),
                        )),
                    validator: (value) => value == null || value.isEmpty
                        ? 'Password wajib diisi'
                        : null,
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: _simpanData,
                      style: ElevatedButton.styleFrom(
                          backgroundColor: pinkFanta,
                          foregroundColor: Colors.white),
                      child: const Text('SIMPAN DATA',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: FutureBuilder<List<UserModelSQL>>(
                future: _futurePeserta,
                builder: (context, snapshot) {
                  // Jika masih loading
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                        child: CircularProgressIndicator(color: pinkFanta));
                  }
                  // Jika terjadi error sistem
                  else if (snapshot.hasError) {
                    return Center(
                        child: Text('Terjadi error: ${snapshot.error}'));
                  }
                  // Jika data kosong
                  else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(
                        child: Text('Belum ada data member terdaftar.'));
                  }

                  final data = snapshot.data!;
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final peserta = data[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: 12),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: pinkFanta.withValues(alpha: 0.2),
                            child: Icon(Icons.person, color: pinkFanta),
                          ),
                          title: Text(peserta.nama,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold)),
                          subtitle:
                              Text('${peserta.nomorHp} • ${peserta.asalKota}'),
                          trailing: const Icon(Icons.check_circle,
                              color: Colors.green, size: 20),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
