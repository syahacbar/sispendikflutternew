class Sebaran {
  final String id;
  final String nama;
  final double lat;
  final double lng;

  Sebaran({
    required this.id,
    required this.nama,
    required this.lat,
    required this.lng,
  });

  factory Sebaran.fromJson(Map<String, dynamic> json) {
    return Sebaran(
      id: json['sekolah_id'],
      nama: json['nama'],
      lat: double.parse(json['lat'].toString()),
      lng: double.parse(json['lng'].toString()),
    );
  }
}
