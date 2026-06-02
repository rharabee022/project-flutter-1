class UserModelSQL {
  final int? id;
  final String nama;
  final String email;
  final String nomorHp;
  final String asalKota;
  final String password; // <-- Tambah password untuk login

  UserModelSQL({
    this.id,
    required this.nama,
    required this.email,
    required this.nomorHp,
    required this.asalKota,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'email': email,
      'nomor_hp': nomorHp,
      'asal_kota': asalKota,
      'password': password,
    };
  }

  factory UserModelSQL.fromMap(Map<String, dynamic> map) {
    return UserModelSQL(
      id: map['id'],
      nama: map['nama'],
      email: map['email'],
      nomorHp: map['nomor_hp'],
      asalKota: map['asal_kota'],
      password: map['password'],
    );
  }
}
