import 'package:flutter/material.dart';

import '../database/hotel_api.dart';
import '../model/hotels.dart';

class HotelGetProvider with ChangeNotifier {
  HotelGetProvider() {
    load();
  }
  List<Hotel> _hotels = <Hotel>[];
  List<Hotel> get hotels => _hotels;
  Future<void> load() async {
    _hotels = await HotelApi().getdata();

    notifyListeners();
  }
}
