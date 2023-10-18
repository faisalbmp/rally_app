import 'dart:developer';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:timed_rally_app/pages/PickParticipantPage.dart';
import 'package:timed_rally_app/pages/ResultsPage.dart';
import 'package:timed_rally_app/pages/TimekeeperPage.dart';
import 'package:timed_rally_app/pages/UserPage.dart';
import 'package:timed_rally_app/widget/widget.dart';
import 'package:timed_rally_app/barcode_scanner_returning_image.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gasber'),
        backgroundColor: Color(0xFFD1353F),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        alignment: Alignment.topCenter,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Image.asset(
            'assets/images/logo.jpeg',
            height: 200,
          ),
          SizedBox(height: 50),
          Container(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(179, 230, 0, 0),
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const PickParticipantPage(),
                ));
              },
              child: const Text(
                'Scan',
                style: TextStyle(fontSize: 50),
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            width: MediaQuery.of(context).size.width,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromARGB(179, 161, 230, 0),
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10))),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ResultsPage(),
                ));
              },
              child: const Text(
                'Result',
                style: TextStyle(fontSize: 50),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
