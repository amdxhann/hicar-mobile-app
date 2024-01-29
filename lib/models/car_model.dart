class CarsModel {
  String nama;
  String jenis;
  String jumlahpintu;
  String kecepatan;
  String ac;
  String harga;

  CarsModel(
      {required this.nama,
      required this.jenis,
      required this.jumlahpintu,
      required this.kecepatan,
      required this.ac,
      required this.harga});

  // receiving data from server
  factory CarsModel.fromMap(map) {
    return CarsModel(
      nama: map['nama'],
      jenis: map['jenis'],
      jumlahpintu: map['jumlahpintu'],
      kecepatan: map['kecepatan'],
      ac: map['ac'],
      harga: map['harga'],
    );
  }

  // sending data to our server
  Map<String, dynamic> toMap() {
    return {
      'nama': nama,
      'jenis': jenis,
      'jumlahpintu': jumlahpintu,
      'kecepatan': kecepatan,
      'ac': ac,
      'harga': harga,
    };
  }
}
