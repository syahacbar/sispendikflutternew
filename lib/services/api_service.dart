import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/distrik_model.dart';

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
}
