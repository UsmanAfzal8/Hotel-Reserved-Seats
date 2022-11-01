import 'package:flutter/material.dart';
import 'package:hotel_reserved_seat/custom_widget/custom_widget.dart';
import 'package:hotel_reserved_seat/custom_widget/elevated_button_custom_widget.dart';

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
              CustomElevatedButton(title: 'User', onTap: () {}),
              CustomElevatedButton(title: 'Resturent', onTap: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
