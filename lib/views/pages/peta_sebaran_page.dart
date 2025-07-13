import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';
import 'package:latlong2/latlong.dart';

import '../../models/sebaran_model.dart';
import '../../services/api_service.dart';

class PetaSebaranPage extends StatefulWidget {
  const PetaSebaranPage({super.key});

  @override
  State<PetaSebaranPage> createState() => _PetaSebaranPageState();
}

class _PetaSebaranPageState extends State<PetaSebaranPage> {
  final MapController _mapController = MapController();
  final PopupController _popupController = PopupController();

  List<Sebaran> _sebaranList = [];
  List<Marker> _markers = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchSebaran();
  }

  Future<void> fetchSebaran() async {
    try {
      final data = await ApiService.fetchSebaran();
      setState(() {
        _sebaranList = data;
        _markers = data.map((item) {
          return Marker(
            point: LatLng(item.lat, item.lng),
            width: 40,
            height: 40,
            child: const Icon(Icons.location_on, color: Colors.red),
          );
        }).toList();
        _isLoading = false;
      });
    } catch (e) {
      print("Gagal fetch sebaran: $e");
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Peta Sebaran Sekolah')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : PopupScope(
              popupController: _popupController,
              child: FlutterMap(
                mapController: _mapController,
                options: MapOptions(
                  initialCenter: const LatLng(-2.1334, 133.5167),
                  initialZoom: 9,
                  interactionOptions: const InteractionOptions(
                    flags: InteractiveFlag.all,
                  ),
                  onTap: (_, __) => _popupController.hideAllPopups(),
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                  MarkerClusterLayerWidget(
                    options: MarkerClusterLayerOptions(
                      maxClusterRadius: 120,
                      markers: _markers,
                      popupOptions: PopupOptions(
                        popupController: _popupController,
                        popupBuilder: (BuildContext context, Marker marker) {
                          final index = _markers.indexOf(marker);
                          if (index >= 0 && index < _sebaranList.length) {
                            final sekolah = _sebaranList[index];
                            return Card(
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  sekolah.nama,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            );
                          }
                          return const Card(
                            child: Text("Data tidak ditemukan"),
                          );
                        },
                      ),
                      builder: (context, markers) {
                        return Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                          child: Center(
                            child: Text(
                              markers.length.toString(),
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
