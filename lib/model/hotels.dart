import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hotel_reserved_seat/model/location.dart';

class Hotel {
  final String hid;
  final int seats;
  final String hotelname;
  final int timestamp;
  final String imageurl;
  final String status;
  final Location location;

  Hotel(
      {required this.hid,
      required this.seats,
      required this.hotelname,
      required this.timestamp,
      required this.imageurl,
      required this.location,
      required this.status});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'hid': hid,
      'timestamp': timestamp,
      'seats': seats,
      'image_url': imageurl,
      'Hotel_name': hotelname,
      'status': status,
      'location': location.toMap(),
    };
  }

  factory Hotel.fromMap(DocumentSnapshot<Map<String, dynamic>> doc) {
    return Hotel(
      hid: doc.data()?['hid'] ?? '',
      timestamp: doc.data()?['timestamp'] ?? 0,
      seats: doc.data()?['seats'] ?? 0,
      hotelname: doc.data()?['Hotel_name'] ?? '',
      imageurl: doc.data()?['image_url'] ?? '',
      status: doc.data()?['status'] ?? '',
      location:
          Location.fromMap(doc.data()?['location'] ?? <String, dynamic>{}),
    );
  }
}
