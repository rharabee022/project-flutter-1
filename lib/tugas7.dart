import 'package:flutter/material.dart';

void main() {
  runApp(const Tugas7Day15());
}

class Tugas7Day15 extends StatelessWidget {
  const Tugas7Day15({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registrasi Aplikasi Kaeri',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pinkAccent),
      ),
      home: const MainNavigationScreen(), // pindah ke navigasi utama
    );
  }
}

// Navigasi screen

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  // Variabel buat tab aktif
  int _currentIndex = 0;

  // List halaman
  final List<Widget> _pages = [
    const InteractiveForm(), // Tab 0: Home
    const AboutPage(), // Tab 1: Tentang
  ];

  // List judul
  final List<String> _titles = ['Registrasi Member Kaeri', 'Tentang Aplikasi'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // AppBar
      appBar: AppBar(
        title: Text(
          _titles[_currentIndex],
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.pinkAccent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),

      // Logic buat drawer
      drawer: _currentIndex == 0 ? const AppDrawer() : null,

      body: _pages[_currentIndex],

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Colors.grey,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Tentang'),
        ],
      ),
    );
  }
}

// 2. Drawer
class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.pinkAccent,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(30)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const CircleAvatar(
                  radius: 35,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.face_retouching_natural,
                    size: 40,
                    color: Color.fromARGB(255, 223, 182, 195),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Kaeri App',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Smart workspace for makeup artist',
                  style: TextStyle(
                    color: Colors.white.withAlpha(230),
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home_outlined, color: Colors.grey.shade700),
            title: const Text('Beranda'),
            onTap: () => Navigator.pop(context),
          ),
          Container(
            color: Colors.pink.shade50,
            child: ListTile(
              leading: const Icon(
                Icons.app_registration,
                color: Colors.pinkAccent,
              ),
              title: const Text(
                'Daftar Klien',
                style: TextStyle(
                  color: Colors.pinkAccent,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () => Navigator.pop(context),
            ),
          ),
          ListTile(
            leading: Icon(Icons.spa_outlined, color: Colors.grey.shade700),
            title: const Text('Katalog Service'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: Icon(
              Icons.calendar_month_outlined,
              color: Colors.grey.shade700,
            ),
            title: const Text('Jadwal Booking'),
            onTap: () => Navigator.pop(context),
          ),
          Divider(color: Colors.grey.shade200, thickness: 5, height: 30),
          ListTile(
            leading: Icon(Icons.settings_outlined, color: Colors.grey.shade700),
            title: const Text('Pengaturan Akun'),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            leading: Icon(Icons.help_outline, color: Colors.grey.shade700),
            title: const Text('Bantuan & FAQ'),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}

class InteractiveForm extends StatefulWidget {
  const InteractiveForm({super.key});

  @override
  State<InteractiveForm> createState() => _InteractiveFormPageState();
}

class _InteractiveFormPageState extends State<InteractiveForm> {
  bool _isAgreed = false;
  bool _isDarkMode = false;
  String? _selectedCategory;
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  final List<String> _categories = [
    'Makeup Wisuda',
    'Makeup PreWedding',
    'Makeup Wedding',
    'Makeup Party',
    'Makeup Mature',
    'Lainnya',
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1980),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.pinkAccent,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.pinkAccent,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Color bgColor = _isDarkMode ? const Color(0xFF2C2C2C) : Colors.white;
    Color textColor = _isDarkMode ? Colors.white : Colors.black87;
    Color cardColor =
        _isDarkMode ? const Color(0xFF3D3D3D) : Colors.pink.shade50;

    return Container(
      color: bgColor,
      child: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: CheckboxListTile(
                      activeColor: Colors.pinkAccent,
                      title: Text(
                        'Saya menyetujui persyaratan',
                        style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        _isAgreed ? 'Client Bersedia' : 'Client Tidak Bersedia',
                        style: TextStyle(
                          color: _isAgreed ? Colors.green : Colors.redAccent,
                        ),
                      ),
                      value: _isAgreed,
                      onChanged: (bool? value) {
                        setState(() {
                          _isAgreed = value ?? false;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 15),
                  Container(
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: SwitchListTile(
                      activeThumbColor: Colors.pinkAccent,
                      title: Text(
                        'Geser jika ingin memakai bulumata',
                        style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      value: _isDarkMode,
                      onChanged: (bool value) {
                        setState(() {
                          _isDarkMode = value;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 25),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: cardColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        hint: Text(
                          'Pilih Kategori Makeup',
                          style: TextStyle(color: textColor.withAlpha(102)),
                        ),
                        value: _selectedCategory,
                        dropdownColor: cardColor,
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.pinkAccent,
                        ),
                        items: _categories.map((String category) {
                          return DropdownMenuItem<String>(
                            value: category,
                            child: Text(
                              category,
                              style: TextStyle(color: textColor),
                            ),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            _selectedCategory = newValue;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pinkAccent,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    icon: const Icon(Icons.calendar_today),
                    label: const Text(
                      'Pilih Tanggal Acara',
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: () => _selectDate(context),
                  ),
                  const SizedBox(height: 15),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.pinkAccent,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    icon: const Icon(Icons.access_time),
                    label: const Text(
                      'Pilih Jam Mulai Makeup',
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: () => _selectTime(context),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: _isDarkMode ? Colors.black87 : Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.pinkAccent.withAlpha(26),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(25),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Ringkasan Data:',
                  style: TextStyle(
                    color: Colors.pinkAccent,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '• Status: ${_isAgreed ? "Client Bersedia" : "Client Tidak Bersedia"}',
                  style: TextStyle(color: textColor),
                ),
                Text(
                  '• Perlu pakai bulumata?: ${_isDarkMode ? "Pakai (Ya)" : "Tidak Perlu (Tidak)"}',
                  style: TextStyle(color: textColor),
                ),
                Text(
                  '• Kategori Makeup: ${_selectedCategory == null ? "Belum dipilih" : "Kamu memilih $_selectedCategory"}',
                  style: TextStyle(color: textColor),
                ),
                Text(
                  '• Tanggal Acara: ${_selectedDate == null ? "Belum diatur" : "${_selectedDate!.day.toString().padLeft(2, '0')}-${_selectedDate!.month.toString().padLeft(2, '0')}-${_selectedDate!.year}"}',
                  style: TextStyle(color: textColor),
                ),
                Text(
                  '• Waktu mulai makeup: ${_selectedTime == null ? "Belum diatur" : "Jam mulai makeup ${_selectedTime!.hour.toString().padLeft(2, '0')}:${_selectedTime!.minute.toString().padLeft(2, '0')}"}',
                  style: TextStyle(color: textColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Tugas 8: Halaman Tentang Aplikasi
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade50,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.face_retouching_natural,
                    size: 80,
                    color: Colors.pinkAccent,
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Aplikasi Kaeri',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.pinkAccent,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Aplikasi workspace pintar yang dirancang khusus untuk membantu mengelola manajemen registrasi dan jadwal klien bagi para profesional Makeup Artist.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Divider(),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Pembuat:',
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text(
                        'Karina Aespa',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Versi Aplikasi:',
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const Text(
                        'v1.0.0 (Tugas 7)',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
