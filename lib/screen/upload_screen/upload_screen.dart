import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:hotel_reserved_seat/model/hotels.dart';
import 'package:hotel_reserved_seat/provider/hotel_upload_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import '../../custom_widget/elevated_button_custom_widget.dart';
import '../../custom_widget/text_custom_widget.dart';
import '../../custom_widget/text_form_custom.widget.dart';
import '../../custom_widget/toast_custom_widget.dart';
import '../../custom_widget/validator_custom_widget.dart';
import '../../database/database_storage_api.dart';
import '../../database/hotel_api.dart';
import '../../function/time_date_function.dart';
import '../../utilities/image_picker.dart';
import 'location_screen.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  final TextEditingController seats = TextEditingController();
  final TextEditingController hotelname = TextEditingController();
  final TextEditingController status = TextEditingController();

  Uint8List? _image;
  bool _isloading = false;
  final _formKey = GlobalKey<FormState>();
  Future<void> uploaddata() async {
    print('Upload main enter ho giya ha');
    HotelProvider hotelPro = Provider.of<HotelProvider>(context, listen: false);
    if (_formKey.currentState!.validate() && _image != null) {
      setState(() {
        _isloading = true;
      });
      String imageurl = await Storagemethod().uploadtostorage(
        'post',
        'tester',
        _image!,
      );
      if (imageurl.isNotEmpty) {
        hotelPro.valuechange(
            hotelname.text, int.parse(seats.text), status.text, imageurl);
      }
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        // ignore: always_specify_types
        MaterialPageRoute(
          builder: (BuildContext context) => const LocationScreen(),
        ),
      );
      setState(() {
        _isloading = false;
      });
    }
  }

  selectImage() async {
    Uint8List? im = await pickImage(ImageSource.gallery);
    // set state because we need to display the image we selected on the circle avatar
    setState(() {
      _image = im;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const ForText(
          name: 'Upload Resturent',
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                _image != null
                    ? GestureDetector(
                        onTap: () {
                          selectImage();
                        },
                        child: Container(
                          height: 200,
                          width: 200,
                          decoration: BoxDecoration(
                              image:
                                  DecorationImage(image: MemoryImage(_image!))),
                        ),
                      )
                    : Container(
                        height: 200,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              IconButton(
                                onPressed: selectImage,
                                icon: const Icon(
                                    Icons.add_circle_outline_outlined,
                                    color: Colors.white,
                                    size: 36),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const ForText(
                                name: 'Add Image',
                                color: Colors.white,
                                size: 22,
                              )
                            ],
                          ),
                        ),
                      ),
                textField(context, hotelname, 'Hotel name'),
                textField(context, status, 'Status'),
                textField(context, seats, 'seats'),
                SizedBox(
                  height: 50,
                ),
                _isloading
                    ? const CircularProgressIndicator()
                    : CustomElevatedButton(
                        title: 'Next',
                        onTap: () {
                          uploaddata();
                        })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget textField(
      BuildContext context, TextEditingController controller, String hint) {
    return Column(
      children: <Widget>[
        const SizedBox(height: 10),
        CustomTextFormField(
          controller: controller,
          // starticon: Icons.person,
          hint: hint,
          validator: (String? value) => CustomValidator.isEmpty(value),
        ),
      ],
    );
  }
}
