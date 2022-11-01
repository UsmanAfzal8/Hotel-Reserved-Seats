// import 'package:cloud_firestore/cloud_firestore.dart';

// import '../custom_widget/toast_custom_widget.dart';
// import '../model/hotels.dart';

// class HotelApi {
//   final FirebaseFirestore _instance = FirebaseFirestore.instance;
//   static const String _collection = 'post';
//   Future<bool> add(Hotel hotel) async {
//     try {
//       await _instance.collection(_collection).doc(hotel.hid).set(hotel.toMap());
//       // CustomToast.successToast(message: 'Successfully Added');
//       return true;
//     } catch (e) {
//       CustomToast.errorToast(message: e.toString());
//       return false;
//     }
//   }

//   Future<List<Hotel>> getdata() async {
//     List<Hotel> hotels = <Hotel>[];
//     QuerySnapshot<Map<String, dynamic>> snapshot =
//         await _instance.collection(_collection).get();
//     for (DocumentSnapshot<Map<String, dynamic>> e in snapshot.docs) {
//       hotels.add(Hotel.fromMap(e));
//     }
//     return hotels;
//   }
// }
