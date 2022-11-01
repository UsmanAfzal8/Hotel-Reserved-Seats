import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class HotelProvider with ChangeNotifier {
  String? _name;
  int? _totalseats;
  String? _status;
  String? _imageurl;

  String? get imageurl => _imageurl;
  String? get name => _name;
  int? get totalseats => _totalseats;
  String? get status => _status;
  valuechange(String name, int seats, String status, String image) {
    print('prvider main phoch giya ha');
    _name = name;
    _imageurl = image;
    _status = status;
    _totalseats = seats;
    notifyListeners();
  }
}
