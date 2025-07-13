import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sispendikbintuni_flutter/models/sekolah_model.dart';
import '../models/distrik_model.dart';
import '../models/sebaran_model.dart';

class ApiService {
  static const String baseUrl = 'https://demo.sispendikbintuni.cloud/api';

  static Future<List<Distrik>> fetchDistrik() async {
    final response = await http.get(Uri.parse('$baseUrl/distriklist'));

    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      final List data = jsonBody['data'];
      return data.map((e) => Distrik.fromJson(e)).toList();
    } else {
      throw Exception('Gagal memuat data distrik');
    }
  }

  static Future<List<Sekolah>> fetchSekolahByDistrik(String kodeWilayah) async {
    final response = await http.get(
      Uri.parse('$baseUrl/sekolah/distrik/$kodeWilayah'),
    );

    if (response.statusCode == 200) {
      final jsonBody = jsonDecode(response.body);
      final List data = jsonBody['data'];
      return data.map((e) => Sekolah.fromJson(e)).toList();
    } else {
      throw Exception('Gagal memuat data sekolah');
    }
  }

  /// Ambil data sebaran sekolah dari endpoint API Laravel
  static Future<List<Sebaran>> fetchSebaran() async {
    final response = await http.get(Uri.parse('$baseUrl/sebaran'));
    if (response.statusCode == 200) {
      final List data = jsonDecode(response.body);
      return data.map((e) => Sebaran.fromJson(e)).toList();
    } else {
      throw Exception('Gagal load data sebaran');
    }
  }
}
