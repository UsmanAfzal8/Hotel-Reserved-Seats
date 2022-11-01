import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hotel_reserved_seat/custom_widget/custom_widget.dart';

class HotelsListWidget extends StatelessWidget {
  const HotelsListWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  ProductProvider productPro = Provider.of<ProductProvider>(context);
    return Expanded(
      child: ListView.builder(
        itemCount: 1,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: InkWell(
              onTap: () {
                
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
                            color: Colors.black),
                      ),
                      SizedBox(
                        width: 120,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            const ForText(
                              name: 'Hotel name',
                              bold: true,
                            ),
                            const ForText(
                              name: 'Hotel location sfbjgknbg d',
                              color: Colors.black38,
                              size: 14,
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
                              onPressed: () {},
                              icon: const Icon(
                                CupertinoIcons.qrcode_viewfinder,
                              )),
                          const ForText(
                            name: 'status',
                            color: Colors.green,
                            size: 14,
                          )
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
}
