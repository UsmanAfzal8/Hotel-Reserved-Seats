import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class HotelUpload with ChangeNotifier {
  String? _name;
  double? _totalseats;
  String? _status;
  Uint8List? _image;

  Uint8List? get Image => _image;
  String? get name => _name;
  double? get totalseats => _totalseats;
  String? get status => _status;
}
