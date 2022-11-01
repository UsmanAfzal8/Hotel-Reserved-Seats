// import 'dart:typed_data';
// import 'package:flutter/material.dart';
// import 'package:hotel_reserved_seat/model/hotels.dart';
// import 'package:image_picker/image_picker.dart';
// import '../../custom_widget/elevated_button_custom_widget.dart';
// import '../../custom_widget/text_custom_widget.dart';
// import '../../custom_widget/text_form_custom.widget.dart';
// import '../../custom_widget/toast_custom_widget.dart';
// import '../../custom_widget/validator_custom_widget.dart';
// import '../../database/database_storage_api.dart';
// import '../../database/hotel_api.dart';
// import '../../function/time_date_function.dart';
// import '../../utilities/image_picker.dart';

// class UploadScreen extends StatefulWidget {
//   const UploadScreen({super.key});

//   @override
//   State<UploadScreen> createState() => _UploadScreenState();
// }

// class _UploadScreenState extends State<UploadScreen> {
//   final TextEditingController seats = TextEditingController();
//   final TextEditingController hotelname = TextEditingController();
//   final TextEditingController hoteldescription = TextEditingController();

//   Uint8List? _image;
//   bool _isloading = false;
//   final _formKey = GlobalKey<FormState>();
//   Future<void> uploaddata() async {
//     if (_formKey.currentState!.validate() && _image != null) {
//       setState(() {
//         _isloading = true;
//       });
//       String imageurl = await Storagemethod().uploadtostorage(
//         'post',
//         'tester',
//         _image!,
//       );

//       Hotel hotel = Hotel(
//           hid: 'firsthotel',
//           seats: int.parse(seats.text),
//           hotelname: hotelname.text,
//           description: hoteldescription.text,
//           timestamp: TimeStamp.timestamp,
//           imageurl: imageurl,
//           location: '',
//           status: true);
//       bool temp = await HotelApi().add(hotel);
//       if (temp) {
//         CustomToast.successToast(message: 'ho giya upload');
//       }
//       setState(() {
//         _isloading = false;
//       });
//     }
//   }

//   selectImage() async {
//     Uint8List? im = await pickImage(ImageSource.gallery);
//     // set state because we need to display the image we selected on the circle avatar
//     setState(() {
//       _image = im;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Upload'),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: <Widget>[
//                 _image != null
//                     ? GestureDetector(
//                         onTap: () {
//                           selectImage();
//                         },
//                         child: Container(
//                           height: 200,
//                           width: 200,
//                           decoration: BoxDecoration(
//                               image:
//                                   DecorationImage(image: MemoryImage(_image!))),
//                         ),
//                       )
//                     : Container(
//                         height: 200,
//                         width: double.infinity,
//                         decoration: const BoxDecoration(
//                           color: Colors.grey,
//                         ),
//                         child: Center(
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: <Widget>[
//                               IconButton(
//                                 onPressed: selectImage,
//                                 icon: const Icon(
//                                     Icons.add_circle_outline_outlined,
//                                     color: Colors.white,
//                                     size: 36),
//                               ),
//                               const SizedBox(
//                                 width: 10,
//                               ),
//                               const ForText(
//                                 name: 'Add Image',
//                                 color: Colors.white,
//                                 size: 22,
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                 textField(context, hotelname, 'Hotel name'),
//                 textField(context, hoteldescription, 'Hotel Description'),
//                 textField(context, seats, 'amount'),
//                 const SizedBox(height: 20),
//                 _isloading
//                     ? const CircularProgressIndicator()
//                     : CustomElevatedButton(
//                         title: 'upload',
//                         onTap: () {
//                           uploaddata();
//                         })
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget textField(
//       BuildContext context, TextEditingController controller, String hint) {
//     return Column(
//       children: <Widget>[
//         const SizedBox(height: 10),
//         CustomTextFormField(
//           controller: controller,
//           // starticon: Icons.person,
//           hint: hint,
//           validator: (String? value) => CustomValidator.isEmpty(value),
//         ),
//       ],
//     );
//   }
// }
