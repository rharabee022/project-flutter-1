import 'package:flutter/material.dart';

import 'database/prefrence_handler.dart';
import 'database/splash_screen.dart';

void main() {
  runApp(const Tugas10());
}

class Tugas10 extends StatelessWidget {
  const Tugas10({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Tugas10Login(),
    );
  }
}

class Tugas10Login extends StatefulWidget {
  const Tugas10Login({super.key});

  @override
  State<Tugas10Login> createState() => _LinkedInLoginPageState();
}

class _LinkedInLoginPageState extends State<Tugas10Login> {
  bool _obscureText = true;

  // mesti pake final di depan nya krn biar ga berubah lg
  final _formKey = GlobalKey<FormState>();

  // Controller untuk mengambil data inputan
  final _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  //kalo ga pake final,
  // yang tulisan final disini tinggal dihapus aja.
  //tp leboh bagus pake final krn datanya ga mungkin berubah Ln 34
  final _kotaController = TextEditingController(); // Data Tambahan Wajib
  final _hpController = TextEditingController(); // Data HP

  // Fungsi untuk menampilkan Dialog Konfirmasi
  void _showConfirmationDialog() {
    showDialog(
      context: context,
      barrierDismissible: false, // User wajib memilih tombol
      builder: (context) {
        return AlertDialog(
          title: const Text('Konfirmasi Pendaftaran'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Email: ${_emailController.text}'),
              const SizedBox(height: 8),
              Text('Kota Asal: ${_kotaController.text}'),
              const SizedBox(height: 8),
              Text('No HP: ${_hpController.text}'),
              const SizedBox(height: 12),
              const Text('Udah bener belom ini data yang lu ketik?'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Batal', style: TextStyle(color: Colors.grey)),
            ),
            ElevatedButton(
              onPressed: () async {
                Navigator.pop(context); // Tutup dialog

                await PreferenceHandler.setLogin(true);

                if (!context.mounted) return;

                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SplashScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0A66C2)),
              child:
                  const Text('Lanjut', style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
          // 2. Membungkus Column dengan widget Form dan memasang key
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Logo LinkedIn
                Row(
                  children: [
                    const Text(
                      'Linked',
                      style: TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 4, vertical: 2),
                      decoration: const BoxDecoration(color: Color(0xFF0A66C2)),
                      child: const Text(
                        'in',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                // Judul
                const Text(
                  'Sign in',
                  style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Stay updated on your professional world',
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                ),
                const SizedBox(height: 24),

                // Kriteria A: Input Email (Diubah dari TextField ke TextFormField + Validator)
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email or Phone *',
                    labelStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Email tidak boleh kosong!';
                    } else if (!value.contains('@')) {
                      return 'Email harus mengandung karakter "@"!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Input Password
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    labelText: 'Password *',
                    labelStyle: const TextStyle(color: Colors.grey),
                    suffixIcon: TextButton(
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      child: Text(
                        _obscureText ? 'show' : 'hide',
                        style: const TextStyle(
                            color: Color(0xFF0A66C2),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Password wajib diisi!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                // Kota Asal
                TextFormField(
                  controller: _kotaController,
                  decoration: InputDecoration(
                    labelText: 'Kota Asal *',
                    labelStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Kota Asal wajib diisi!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // No HP
                TextFormField(
                  controller: _hpController,
                  keyboardType:
                      TextInputType.phone, // Memunculkan keyboard angka/telepon
                  decoration: InputDecoration(
                    labelText: 'Silakan Isi Nomor Hp *',
                    labelStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nomer Handphone wajib diisi!';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Forgot Password
                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(
                        color: Color(0xFF0A66C2),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
                const SizedBox(height: 24),

                // Tombol Sign In dengan Logika Validasi
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      // Trigger validasi Form
                      if (_formKey.currentState!.validate()) {
                        // Jika lolos validasi, muncul pop-up dialog
                        _showConfirmationDialog();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF0A66C2),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 24),

                // Divider "or"
                Row(
                  children: const [
                    Expanded(child: Divider(color: Colors.grey)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text('or', style: TextStyle(color: Colors.grey)),
                    ),
                    Expanded(child: Divider(color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 24),

                // Tombol Google
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.g_mobiledata, color: Colors.red, size: 30),
                        SizedBox(width: 8),
                        Text('Continue with Gugel',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 16)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),

                // Tombol Apple
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.grey),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.apple, color: Colors.black, size: 24),
                        SizedBox(width: 8),
                        Text('Sign in with Apel',
                            style:
                                TextStyle(color: Colors.black87, fontSize: 16)),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 40),

                // Bagian Join Now
                Center(
                  child: RichText(
                    text: const TextSpan(
                      text: 'Baru ke LinkedIn? ',
                      style: TextStyle(color: Colors.black54, fontSize: 16),
                      children: [
                        TextSpan(
                          text: 'Join now',
                          style: TextStyle(
                              color: Color(0xFF0A66C2),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

//  Halaman konfirmasi yg pop up

class HalamanKonfirmasi extends StatelessWidget {
  final String email;
  final String kota;
  final String hp;

  // data dr page sblmnya
  const HalamanKonfirmasi({
    super.key,
    required this.email,
    required this.kota,
    required this.hp,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Konfirmasi Sukses'),
        backgroundColor: const Color(0xFF0A66C2),
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle_outline,
                  color: Colors.green, size: 80),
              const SizedBox(height: 24),
              Text(
                //
                'Cie daftar nich, tengkyu ya $email dari $kota (HP: $hp) udah daftar.',
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  // back keawal
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0A66C2)),
                child: const Text('Kembali',
                    style: TextStyle(color: Colors.white)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
