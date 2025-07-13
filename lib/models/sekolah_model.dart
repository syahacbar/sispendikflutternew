class Sekolah {
  final int sekolahId;
  final String nama;
  final String npsn;
  final String jenjang;
  final String statusSekolah;
  final int? pesertaDidik;
  final int? rombel;
  final int? guru;

  Sekolah({
    required this.sekolahId,
    required this.nama,
    required this.npsn,
    required this.jenjang,
    required this.statusSekolah,
    this.pesertaDidik,
    this.rombel,
    this.guru,
  });

  factory Sekolah.fromJson(Map<String, dynamic> json) {
    return Sekolah(
      sekolahId: json['sekolah_id'],
      nama: json['nama'],
      npsn: json['npsn'],
      jenjang: json['jenjang'],
      statusSekolah: json['status_sekolah'],
      pesertaDidik: json['peserta_didik'] ?? 0,
      rombel: json['rombel'] ?? 0,
      guru: json['guru'] ?? 0,
    );
  }
}
