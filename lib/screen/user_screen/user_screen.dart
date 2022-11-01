import 'package:flutter/material.dart';
import 'package:hotel_reserved_seat/custom_widget/custom_widget.dart';

import 'hotels_list.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff1f5f1),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.only(top: 30, right: 22, bottom: 20, left: 22),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: const Color.fromARGB(255, 66, 66, 66)
                          .withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: const TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: '    Search...',
                      suffixIcon: Icon(Icons.search)),
                  // onChanged: (String val) => testPro.onSearch(val),
                  // onChanged: (String val) (){},
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 60,
                    width: 200,
                    child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: <BoxShadow>[
                            BoxShadow(
                              color: const Color.fromARGB(255, 66, 66, 66)
                                  .withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const <Widget>[
                            ForText(name: 'Location'),
                            Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black,
                              size: 42,
                            )
                          ],
                        )),
                  ),
                  const Icon(Icons.menu, size: 30),
                ],
              ),
              const SizedBox(height: 10),
              const HotelsListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
