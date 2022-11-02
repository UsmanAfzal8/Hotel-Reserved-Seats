import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hotel_reserved_seat/model/hotels.dart';
import 'package:hotel_reserved_seat/model/location.dart';
import 'package:hotel_reserved_seat/screen/main_screen/main_screen.dart';

import '../database/database_storage_api.dart';
import '../database/hotel_api.dart';

class HotelProvider with ChangeNotifier {
  String? _name;
  int? _totalseats;
  String? _status;
  String? _uid;
  Uint8List? _image;
  bool onchanged = false;
  Uint8List? get image => _image;
  String? get name => _name;
  int? get totalseats => _totalseats;
  String? get status => _status;
  bool valuechange(
      String name, int seats, String status, Uint8List image, String id) {
    bool temp = false;
    print('prvider main phoch giya ha');
    _name = name;
    _uid = id;
    _image = image;
    _status = status;
    _totalseats = seats;
    temp = true;
    return temp;
  }

  String? _lat;
  String? _lon;
  String? _country;
  String? _city;
  String? _area;
  bool locationupdate(
      String lat, String lon, String country, String city, String area) {
    bool temp = false;

    _lat = lat;
    _lon = lon;
    _country = country;
    _city = city;
    _area = area;
    temp = true;
    return temp;
  }

  Future<void> onRegister(BuildContext context) async {
    onchanged = true;
    Location location = Location(
        latitude: _lat!,
        longitude: _lon!,
        country: _country!,
        locality: _city!,
        sublocality: _area!);
    String? url = '';
    if (_image != null) {
      //url = await UserApi().uploadProfilePhoto(file: _profilePhoto!);
      url = await Storagemethod().uploadtostorage(
        'users',
        _uid!,
        _image!,
      );
    }
    Hotel hotel = Hotel(
        hid: _uid!,
        seats: _totalseats!,
        hotelname: _name!,
        timestamp: 123,
        imageurl: url,
        location: location,
        status: _status!);
    bool tt = await HotelApi().add(hotel);
    if (tt) {
      onchanged = false;
      Navigator.push(
        context,
        // ignore: always_specify_types
        MaterialPageRoute(
          builder: (BuildContext context) => const MainScreen(),
        ),
      );
    }
  }
}
