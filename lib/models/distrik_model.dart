class Distrik {
  final String kode;
  final String nama;
  final int totalSekolah;
  final int totalNegeri;
  final int totalSwasta;
  final Map<String, dynamic> jenjang;

  Distrik({
    required this.kode,
    required this.nama,
    required this.totalSekolah,
    required this.totalNegeri,
    required this.totalSwasta,
    required this.jenjang,
  });

  factory Distrik.fromJson(Map<String, dynamic> json) {
    final jenjangMap = Map<String, dynamic>.from(json)
      ..remove('kode')
      ..remove('nama')
      ..remove('total_sekolah')
      ..remove('total_negeri')
      ..remove('total_swasta');

    return Distrik(
      kode: json['kode'],
      nama: json['nama'],
      totalSekolah: json['total_sekolah'],
      totalNegeri: json['total_negeri'],
      totalSwasta: json['total_swasta'],
      jenjang: jenjangMap,
    );
  }
}
