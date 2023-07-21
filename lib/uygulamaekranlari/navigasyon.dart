import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:uv_protection/sabitler/my_input.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  final start = TextEditingController();
  final end = TextEditingController();
  bool isVisible = false;
  List<LatLng> routePoints = [LatLng(43.210, 32.1023)];

  @override
  Widget build(BuildContext context) {
    // value'yu cekip, buna esitlemek lazim **kubra
/*     final value = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map; */

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              MyInput(controler: start, hint: 'Enter Starting Postcode'),
              const SizedBox(
                height: 10,
              ),
              MyInput(controler: end, hint: 'Enter Ending Postcode'),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF505dd8)),
                onPressed: () async {
                  List<Location> startCoord =
                      await locationFromAddress(start.text);
                  List<Location> endCoord = await locationFromAddress(end.text);

                  var v1 = startCoord[0].latitude;
                  var v2 = startCoord[0].longitude;
                  var v3 = endCoord[0].latitude;
                  var v4 = endCoord[0].longitude;

                  var url = Uri.parse(
                      'http://router.project-osrm.org/route/v1/driving/$v2,$v1;$v4,$v3?steps=true&annotations=true&geometries=geojson&overview=full');
                  var response = await http.get(url);
                  setState(() {
                    routePoints = [];
                    var routeMaker = jsonDecode(response.body)['routes'][0]
                        ['geometry']['coordinates'];
                    for (int i = 0; i < routeMaker.length; i++) {
                      var reep = routeMaker[i].toString();
                      reep = reep.replaceAll("[", "");
                      reep = reep.replaceAll("]", "");
                      var lat1 = reep.split(',');
                      var long1 = reep.split(",");
                      routePoints.add(LatLng(
                          double.parse(lat1[1]), double.parse(long1[0])));
                    }
                    isVisible = !isVisible;
                  });
                },
                child: const Text('Get Directions'),
              ),
              SizedBox(
                height: 500,
                width: 400,
                child: Visibility(
                  visible: isVisible,
                  child: FlutterMap(
                    options: MapOptions(
                      center: routePoints[0],
                      zoom: 10,
                    ),
                    nonRotatedChildren: [
                      AttributionWidget.defaultWidget(
                          source: 'UV Protection', onSourceTapped: null),
                    ],
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.app',
                      ),
                      PolylineLayer(
                        polylineCulling: false,
                        polylines: [
                          Polyline(
                              points: routePoints,
                              color: Colors.blue,
                              strokeWidth: 9)
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
