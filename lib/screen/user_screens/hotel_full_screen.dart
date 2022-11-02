import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hotel_reserved_seat/custom_widget/custom_widget.dart';
import 'package:hotel_reserved_seat/custom_widget/elevated_button_custom_widget.dart';

import '../../model/hotels.dart';

class HotelFullScreen extends StatefulWidget {
  final Hotel hotel;
  HotelFullScreen({super.key, required this.hotel});

  @override
  State<HotelFullScreen> createState() => _HotelFullScreenState();
}

class _HotelFullScreenState extends State<HotelFullScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  late double currentlat;
  late double currentlng;
  late CameraPosition cameraPosition;
  @override
  void initState() {
    currentlat = double.parse(widget.hotel.location.latitude);
    currentlng = double.parse(widget.hotel.location.longitude);
    cameraPosition =
        CameraPosition(zoom: 14, target: LatLng(currentlat, currentlng));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xfff1f5f1),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text(
            widget.hotel.hotelname,
            style: TextStyle(color: Colors.black),
          ),
          leading: IconButton(
              onPressed: (() {
                Navigator.pop(context);
              }),
              icon: const Icon(
                Icons.arrow_back_ios_sharp,
                color: Colors.black,
              )),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                height: 230,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(26),
                  image: DecorationImage(
                              image:
                                  NetworkImage(widget.hotel.imageurl),
                            )
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ForText(name: widget.hotel.hotelname,bold: true,),
                          ForText(
                            name: widget.hotel.status,
                            color: widget.hotel.status == 'close'
                                ? Colors.red
                                : Colors.green,
                            size: 14,
                          ),
                        ],
                      ),
                      ForText(
                              name:
                                  '${widget.hotel.location.sublocality},${widget.hotel.location.locality}',
                              color: Colors.black38,
                              size: 12,
                            ),
                            ForText(
                              name: widget.hotel.location.country,
                              color: Colors.black38,
                              size: 12,
                            ),
                      SizedBox(
                        width: 130,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const <Widget>[
                            Icon(
                              Icons.table_restaurant_rounded,
                              color: Colors.black38,
                            ),
                            Icon(
                              Icons.wifi,
                              color: Colors.black38,
                            ),
                            Icon(
                              Icons.restaurant,
                              color: Colors.black38,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        CupertinoIcons.qrcode_viewfinder,
                        size: 42,
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 230,
                  width: double.infinity,
                  color: Colors.black,
                  child: GoogleMap(
                    initialCameraPosition: cameraPosition,
                    // ignore: always_specify_types
                    markers: {
                      Marker( 
                        onTap: () {
                          showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              context: context,
                              builder: ((BuildContext context) {
                                return SizedBox(
                                  height: 70,
                                  width: double.infinity,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children:  <Widget>[
                                     const Icon(Icons.location_on),
                                      ForText(name: widget.hotel.hotelname)
                                    ],
                                  ),
                                );
                              }));
                        },
                        markerId: const MarkerId('current location'),
                        position: LatLng(currentlat, currentlng),
                      ),
                    },
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                ),
              ),
              Spacer(),
              SizedBox(
                width: 300,
                child: CustomElevatedButton(
                  title: 'Reserved a table',
                  onTap: () {},
                  bgColor: const Color(0xffe38614),
                ),
              ),
              const SizedBox(height: 10)
            ],
          ),
        ));
  }
}
