import 'dart:developer';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timed_rally_app/pages/HomePage.dart';
import 'package:timed_rally_app/pages/UserPage.dart';
import 'package:timed_rally_app/shared/timekeepers.dart';
import 'package:timed_rally_app/widget/widget.dart';
import 'package:timed_rally_app/barcode_scanner_returning_image.dart';

class TimekeeperPage extends StatelessWidget {
  const TimekeeperPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(children: [
          GestureDetector(
              onTap: () {
                nextScreen(context, HomePage());
              },
              child: Icon(Icons.home)),
          SizedBox(
            width: 50,
          ),
          Text('Pos Section'),
        ]),
        backgroundColor: Color(0xFFD1353F),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(179, 230, 0, 0),
                      padding: EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setInt('timekeeper', Timekeepers().START);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          const BarcodeScannerReturningImage(),
                    ));
                  },
                  child: const Text(
                    'Start',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(179, 230, 0, 0),
                      padding: EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setInt('timekeeper', Timekeepers().POS_1);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          const BarcodeScannerReturningImage(),
                    ));
                  },
                  child: const Text(
                    'Pos 1',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(179, 230, 0, 0),
                      padding: EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setInt('timekeeper', Timekeepers().POS_2);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          const BarcodeScannerReturningImage(),
                    ));
                  },
                  child: const Text(
                    'Pos 2',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(179, 230, 0, 0),
                      padding: EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setInt('timekeeper', Timekeepers().POS_3);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          const BarcodeScannerReturningImage(),
                    ));
                  },
                  child: const Text(
                    'Pos 3',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(179, 230, 0, 0),
                      padding: EdgeInsets.all(20),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    await prefs.setInt('timekeeper', Timekeepers().FINAL);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          const BarcodeScannerReturningImage(),
                    ));
                  },
                  child: const Text(
                    'Finish',
                    style: TextStyle(fontSize: 50),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
