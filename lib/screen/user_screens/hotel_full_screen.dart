import 'package:flutter/material.dart';

class HotelFullScreen extends StatelessWidget {
  const HotelFullScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff1f5f1),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          'name',
          style: TextStyle(color: Colors.black),
        ),
        leading: IconButton(
            onPressed: (() {
              Navigator.pop(context);
            }),
            icon: const Icon(
              Icons.arrow_back_ios_sharp,
              color: Colors.black,
            )),
        actions: const <Widget>[Icon(Icons.more_vert)],
      ),
      body: Center(child: Text('HotelFullScreen')),
    );
  }
}
