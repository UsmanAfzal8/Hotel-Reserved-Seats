import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_reserved_seat/custom_widget/custom_widget.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:provider/provider.dart';

import '../provider/allhotels_provider.dart';
import '../screen/user_screens/hotel_full_screen.dart';

class HotelsListWidget extends StatelessWidget {
  const HotelsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  ProductProvider productPro = Provider.of<ProductProvider>(context);
    HotelGetProvider hotelPro = Provider.of<HotelGetProvider>(context);
    return Expanded(
      child: ListView.builder(
        itemCount: hotelPro.hotels.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  // ignore: always_specify_types
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        HotelFullScreen(hotel: hotelPro.hotels[index]),
                  ),
                );
              },
              child: Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(22),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: 100,
                        width: 130,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: Colors.black,
                            image: DecorationImage(
                              image:
                                  NetworkImage(hotelPro.hotels[index].imageurl),
                            )),
                      ),
                      SizedBox(
                        width: 120,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            ForText(
                              name: hotelPro.hotels[index].hotelname,
                              bold: true,
                            ),
                            ForText(
                              name:
                                  '${hotelPro.hotels[index].location.sublocality},${hotelPro.hotels[index].location.locality}',
                              color: Colors.black38,
                              size: 12,
                            ),
                            ForText(
                              name: hotelPro.hotels[index].location.country,
                              color: Colors.black38,
                              size: 12,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const <Widget>[
                                Icon(Icons.table_restaurant_rounded),
                                Icon(Icons.wifi),
                                Icon(Icons.restaurant),
                              ],
                            )
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          IconButton(
                              onPressed: () {
                                qrbox(context);
                              },
                              icon: const Icon(
                                CupertinoIcons.qrcode_viewfinder,
                              )),
                          ForText(
                            name: hotelPro.hotels[index].status,
                            color: hotelPro.hotels[index].status == 'close'
                                ? Colors.red
                                : Colors.green,
                            size: 14,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future<dynamic> qrbox(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(
              child: Column(
            children: const          <Widget>[
              Text("Scan"),
              Text("to access my profile"),
            ],
          )),
          content: const Text("It will show website if any one scan it."),
          actions: [
            Column(
              children: [
                Center(
                  child: SizedBox(
                    height: 200,
                    width: 200,
                    child: PrettyQr(
                      image: const AssetImage('assets/images/kliky_logo.png'),
                      typeNumber: 3,
                      size: 200,
                      data: 'https://www.google.com',
                      errorCorrectLevel: QrErrorCorrectLevel.M,
                      roundEdges: true,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      'cancel',
                      style: TextStyle(color: Colors.black38),
                    )),
              ],
            ),
          ],
        );
        ;
      },
    );
  }
}
