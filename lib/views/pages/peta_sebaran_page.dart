import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class PetaSebaranPage extends StatelessWidget {
  const PetaSebaranPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Peta Sebaran')),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(-2.1344, 133.5161), // Titik koordinat Teluk Bintuni
          zoom: 10.0,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
            subdomains: ['a', 'b', 'c'],
          ),
          MarkerLayer(
            markers: [
              Marker(
                point: LatLng(-2.1344, 133.5161),
                width: 40,
                height: 40,
                child: const Icon(
                  Icons.location_pin,
                  color: Colors.red,
                  size: 40,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
