// import 'dart:html';

// import 'package:cloud_firestore/cloud_firestore.dart';

// class Hotel {
//   final String hid;
//   final int seats;
//   final String hotelname;
//   final String description;
//   final int timestamp;
//   final String imageurl;
//   final bool status;
//   final Location location;
//   Hotel(
//       {required this.hid,
//       required this.seats,
//       required this.hotelname,
//       required this.description,
//       required this.timestamp,
//       required this.imageurl,
//       required this.location,
//       required this.status});

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'hid': hid,
//       'description': description,
//       'timestamp': timestamp,
//       'seats': seats,
//       'image_url': imageurl,
//       'Hotel_name': hotelname,
//       'status': status,
//       'location':location
//     };
//   }

//   factory Hotel.fromMap(DocumentSnapshot<Map<String, dynamic>> doc) {
//     return Hotel(
//       hid: doc.data()?['hid'] ?? '',
//       description: doc.data()?['description'] ?? '',
//       timestamp: doc.data()?['timestamp'] ?? '',
//       seats: doc.data()?['seats'] ?? '',
//       hotelname: doc.data()?['hotel_name'] ?? '',
//       imageurl: doc.data()?['image_url'] ?? '',
//       status: doc.data()?['status'] ?? '', 
//       location: doc.data()?['location'] ?? '', 
//     );
//   }
// }
