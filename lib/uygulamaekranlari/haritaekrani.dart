import 'package:flutter/material.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  String locationMessage = 'Kullanicinin Güncel Konumu Getir';
  double long = 35.00;
  double lat = 35.00;
  bool isVisible = false;
  bool isEnabled = true;

  Future<Position> _getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location service turned off');
    }
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location Permission denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Application Permission Denied Indefinitely. Unable to request permission.');
    }
    //print('_getCurrentLocation calisti');
    return await Geolocator.getCurrentPosition();
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation().then((value) {
      lat = value.latitude;
      long = value.longitude;
      //print('initstate calisti');
      setState(() {
        isVisible = true;
      });
    }).catchError((e) {
      setState(() {
        isEnabled = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (!isVisible && isEnabled) ...[
            const SizedBox(
              //height: 10,
              child: Text("The map is loading."),
            ),
          ],
          if (!isEnabled) ...[
            const SizedBox(
              //height: 10,
              child: Text(
                  "Please make sure that your Location Service is turned on and that you have given the necessary permissions."),
            ),
          ],
          if (isVisible) ...[
            Expanded(
              child: SizedBox(
                height: size.height - 100,
                width: size.width,
                child: FlutterMap(
                  options: MapOptions(
                    center: LatLng(lat, long),
                    zoom: 14,
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      userAgentPackageName: 'com.example.app',
                    ),
                    MarkerLayer(
                      rotate: false,
                      markers: [
                        Marker(
                          point: LatLng(lat, long),
                          anchorPos: AnchorPos.align(AnchorAlign.center),
                          builder: (ctx) => const Icon(
                            Icons.run_circle,
                            size: 60,
                            color: Color.fromARGB(255, 10, 73, 102),
                          ),
                        ),
                        Marker(
                          point: LatLng((lat + 0.01), (long + 0.008)),
                          anchorPos: AnchorPos.align(AnchorAlign.center),
                          builder: (ctx) => const Icon(
                            Icons.medical_services_outlined,
                            size: 40,
                            color: Colors.red,
                          ),
                        ),
                        Marker(
                          point: LatLng((lat - 0.01), (long - 0.011)),
                          anchorPos: AnchorPos.align(AnchorAlign.center),
                          builder: (ctx) => const Icon(
                            Icons.shopping_cart_outlined,
                            size: 40,
                            color: Colors.black,
                          ),
                        ),
                        Marker(
                          point: LatLng((lat - 0.01), (long + 0.009)),
                          anchorPos: AnchorPos.align(AnchorAlign.center),
                          builder: (ctx) => const Icon(
                            Icons.local_pharmacy_rounded,
                            size: 50,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
          /*         SizedBox(
            child: Visibility(
              visible: (!isVisible && isEnabled),
              // harita yuklenirken, bos ekranda basilacak mesaj
              child: const Text("The map is loading."),
            ),
          ), */
          /* SizedBox(
            child: Visibility(
              visible: (!isEnabled),
              // harita yuklenirken, bos ekranda basilacak mesaj
              child: const Text(
                  "Please make sure that your Location Service is turned on and that you have given the necessary permissions."),
            ),
          ), */
          /* SizedBox(
            height: size.height - 100,
            width: size.width,
            child: Visibility(
              visible: isVisible,
              child: FlutterMap(
                options: MapOptions(
                  center: LatLng(lat, long),
                  zoom: 14,
                ),
                children: [
                  TileLayer(
                    urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                  MarkerLayer(
                    rotate: false,
                    markers: [
                      Marker(
                        point: LatLng(lat, long),
                        anchorPos: AnchorPos.align(AnchorAlign.center),
                        builder: (ctx) => const Icon(
                          Icons.run_circle,
                          size: 60,
                          color: Color.fromARGB(255, 10, 73, 102),
                        ),
                      ),
                      Marker(
                        point: LatLng((lat + 0.01), (long + 0.008)),
                        anchorPos: AnchorPos.align(AnchorAlign.center),
                        builder: (ctx) => const Icon(
                          Icons.medical_services_outlined,
                          size: 40,
                          color: Colors.red,
                        ),
                      ),
                      Marker(
                        point: LatLng((lat - 0.01), (long - 0.011)),
                        anchorPos: AnchorPos.align(AnchorAlign.center),
                        builder: (ctx) => const Icon(
                          Icons.shopping_cart_outlined,
                          size: 40,
                          color: Colors.black,
                        ),
                      ),
                      Marker(
                        point: LatLng((lat - 0.01), (long + 0.009)),
                        anchorPos: AnchorPos.align(AnchorAlign.center),
                        builder: (ctx) => const Icon(
                          Icons.local_pharmacy_rounded,
                          size: 50,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ), */
        ],
      ),
    );
  }
}
