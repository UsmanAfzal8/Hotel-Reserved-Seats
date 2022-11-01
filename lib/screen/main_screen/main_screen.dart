import 'package:flutter/material.dart';
import 'package:hotel_reserved_seat/custom_widget/custom_widget.dart';
import 'package:hotel_reserved_seat/custom_widget/elevated_button_custom_widget.dart';

import '../upload_screen/upload_screen.dart';
import '../user_screens/user_screen.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff1f5f1),
      appBar: AppBar(
        centerTitle: true,
        title: const ForText(
          name: 'Hotel Reserved Seats',
          bold: true,
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: SizedBox(
          width: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomElevatedButton(title: 'User', onTap: () {
                 Navigator.push(
                            context,
                            // ignore: always_specify_types
                            MaterialPageRoute(
                              builder: (BuildContext context) => const UploadScreen(),
                            ),
                          );
              }),
              CustomElevatedButton(title: 'Resturent', onTap: () {
                  Navigator.push(
                            context,
                            // ignore: always_specify_types
                            MaterialPageRoute(
                              builder: (BuildContext context) => const UserScreen(),
                            ),
                          );

              }),
            ],
          ),
        ),
      ),
    );
  }
}
