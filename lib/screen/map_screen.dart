import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapSample extends StatefulWidget {
  const MapSample({super.key});

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();
  static double currentlat = 31.485722;
  static double currentlng = 74.32648689999996;
  BitmapDescriptor currrenticon = BitmapDescriptor.defaultMarker;
  CameraPosition cameraPosition =
      CameraPosition(zoom: 14, target: LatLng(currentlat, currentlng));
  LocationData? currentlocation;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: currentlocation == null
          ? const Center(child: CircularProgressIndicator())
          : GoogleMap(
              initialCameraPosition: cameraPosition,
              markers: {
                Marker(
                  markerId: const MarkerId('current location'),
                  icon: currrenticon,
                  position: LatLng(currentlat, currentlng),
                ),
              },
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: getCurrentLocation,
        label: const Text('Current Location!'),
        icon: const Icon(Icons.circle),
      ),
    );
  }

  Future<void> getCurrentLocation() async {
    Location location = Location();
    location.getLocation().then((location) async {
      currentlocation = location;
      setState(() {
        currentlat = location.latitude!;
        currentlng = location.longitude!;
      });
      cameraPosition = CameraPosition(
          zoom: 18, target: LatLng(location.latitude!, location.longitude!));

      final GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
      setState(() {});
    });
  }
}
