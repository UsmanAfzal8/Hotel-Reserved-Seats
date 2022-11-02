import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hotel_reserved_seat/custom_widget/elevated_button_custom_widget.dart';
import 'package:location/location.dart' as loc;
import 'package:provider/provider.dart';
import '../../custom_widget/text_custom_widget.dart';
import '../../provider/hotel_upload_provider.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});
  static String routes = '/locationscreen';

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  static double currentlat = 31.485722;
  static double currentlng = 74.32648689999996;
  BitmapDescriptor currrenticon = BitmapDescriptor.defaultMarker;
  CameraPosition cameraPosition =
      CameraPosition(zoom: 14, target: LatLng(currentlat, currentlng));
  loc.LocationData? currentlocation;

  @override
  void initState() {
    super.initState();
    getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    HotelProvider hotelPro = Provider.of<HotelProvider>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const ForText(
          name: 'Location Update',
          bold: true,
        ),
        centerTitle: true,
        leading: IconButton(
            onPressed: (() {
              // Provider.of<AppProvider>(context, listen: false).onTabTapped(0);
              Navigator.pop(context);
            }),
            icon: const Icon(
              Icons.arrow_back_ios_sharp,
              color: Colors.black,
            )),
      ),
      body: Column(
        children: [
          Expanded(
            child: currentlocation == null
                ? const Center(child: CircularProgressIndicator())
                : GoogleMap(
                    initialCameraPosition: cameraPosition,
                    markers: {
                      Marker(
                        onTap: () {},
                        markerId: const MarkerId('current location'),
                        icon: currrenticon,
                        position: LatLng(currentlat, currentlng),
                      ),
                    },
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
          ),
        hotelPro.onchanged? const CircularProgressIndicator(): CustomElevatedButton(
              title: 'Upload',
              onTap: () async {
                List<Placemark> placemarks =
                    await placemarkFromCoordinates(currentlat, currentlng);
                bool temp = hotelPro.locationupdate(
                  currentlat.toString(),
                  currentlng.toString(),
                  placemarks[0].country.toString(),
                  placemarks[0].locality!,
                  placemarks[0].subLocality!,
                );
                if (temp) {
                 // ignore: use_build_context_synchronously
                 hotelPro.onRegister(context);
                }
              })
        ],
      ),
    );
  }

  Future<void> getCurrentLocation() async {
    loc.Location location = loc.Location();
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
