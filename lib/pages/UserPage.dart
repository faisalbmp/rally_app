import 'dart:convert';
import 'dart:math';

import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timed_rally_app/model/participantModel.dart';
import 'package:timed_rally_app/model/resultModel.dart';
import 'package:timed_rally_app/pages/HomePage.dart';
import 'package:timed_rally_app/pages/ResultPage.dart';
import 'package:timed_rally_app/pages/TimekeeperPage.dart';
import 'package:timed_rally_app/service/data_service.dart';
import 'package:timed_rally_app/shared/timekeepers.dart';
import 'package:timed_rally_app/widget/widget.dart';

class UserPage extends StatefulWidget {
  // const UserPage({required this.id }):super.key;
  final String id;
  final DateTime date;
  final Map<String, dynamic> data;
  final BarcodeCapture? barcode;
  final Uint8List? imageUint8;

  // final XFile? file;
  const UserPage(
      {Key? key,
      required this.id,
      required this.date,
      required this.imageUint8,
      required this.data,
      required this.barcode /*  required this.file */})
      : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  int? timekeeper;
  ResultModel? result;
  TextEditingController? _controller;
  SharedPreferences? preferences;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    initializePreference().whenComplete(() {
      setState(() {});
    });
  }

  Future<void> initializePreference() async {
    this.preferences = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
          appBar: AppBar(
            title: Row(
              children: [
                GestureDetector(
                    onTap: () {
                      nextScreen(context, HomePage());
                    },
                    child: Icon(Icons.home)),
                SizedBox(
                  width: 50,
                ),
                Text("Detail Page"),
              ],
            ),
            automaticallyImplyLeading: false,
            backgroundColor: Color(0xFFD1353F),
          ),
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                widget.imageUint8 != null
                    ? Transform.rotate(
                        angle: 90 * pi / 180,
                        child: Image(
                          width: 200,
                          height: 200,
                          gaplessPlayback: true,
                          image: MemoryImage(widget.imageUint8!),
                          fit: BoxFit.cover,
                        ),
                      )
                    : const Center(
                        child: Text(
                          'Your scanned barcode will appear here!',
                        ),
                      ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  // 'Pos : ${preferences?.getInt('timekeeper')}',
                  'Pos : ${this.preferences?.getInt('timekeeper') == Timekeepers().START ? "Start" : this.preferences?.getInt('timekeeper') == Timekeepers().POS_1 ? "Pos 1" : this.preferences?.getInt('timekeeper') == Timekeepers().POS_2 ? "Pos 2" : this.preferences?.getInt('timekeeper') == Timekeepers().POS_3 ? "Pos 3" : "Final"}',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Team : " + widget.data['team'],
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Waktu : " +
                      widget.date.hour.toString() +
                      ":" +
                      widget.date.minute
                          .toString() /* +
                      ":" +
                      widget.date.second.toString() */
                  ,
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Nama : " + widget.data['nama_lengkap'],
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  ElevatedButton(
                    onPressed: () {
                      submitResult();
                    },
                    child: const Text('Submit'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: () {
                      nextScreen(context, TimekeeperPage());
                    },
                    child: const Text('Cancel'),
                  ),
                ]),
              ],
            ),
          )
          /* body: FutureBuilder(
          future: DataService().getParticipant(id: widget.id),
          builder:
              (BuildContext context, AsyncSnapshot<ParticipantModel> snapshot) {
            Widget children;
            if (snapshot.hasData) {
              final podcastDatas = snapshot.data;
              children = Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  widget.imageUint8 != null
                      ? Transform.rotate(
                          angle: 90 * pi / 180,
                          child: Image(
                            width: 200,
                            height: 200,
                            gaplessPlayback: true,
                            image: MemoryImage(widget.imageUint8!),
                            fit: BoxFit.cover,
                          ),
                        )
                      : const Center(
                          child: Text(
                            'Your scanned barcode will appear here!',
                          ),
                        ),
                  SizedBox(
                    height: 150,
                  ),
                  Text(
                    "Peserta : " + snapshot.data!.nama_lengkap.toString(),
                    style: TextStyle(fontSize: 24),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Waktu : " +
                        widget.date.hour.toString() +
                        ":" +
                        widget.date.minute.toString() +
                        ":" +
                        widget.date.second.toString(),
                    style: TextStyle(fontSize: 24),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              children = Column(children: [
                const Icon(
                  Icons.error_outline,
                  color: Colors.red,
                  size: 60,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text('Error: ${snapshot.error}'),
                ),
              ]);
            } else {
              children = Column(
                children: [
                  SizedBox(
                    width: 60,
                    height: 60,
                    child: CircularProgressIndicator(),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 16),
                    child: Text('Awaiting result...'),
                  ),
                ],
              );
            }
            return Container(alignment: Alignment.center, child: children);
          },
        ), */
          ),
      if (_isLoading)
        const Opacity(
          opacity: 0.8,
          child: ModalBarrier(dismissible: false, color: Colors.black),
        ),
      if (_isLoading)
        const Center(
          child: CircularProgressIndicator(),
        ),
    ]);
  }

  submitResult() async {
    setState(() {
      _isLoading:
      true;
    });
    List _fifoList = [];
    bool? periodic = false;
    /* String listJson = this.preferences!.getString('list') ?? '[]';
    _fifoList = List.from(jsonDecode(listJson)); */
    /* _fifoList.add({
      'team': widget.data['team'],
      'name': widget.data['nama_lengkap'],
      'time': widget.date.toString(),
      'pos': this.preferences?.getInt('timekeeper')
    }); */
    _isLoading = true;
    print('loading');
    final item = {
      'team': widget.data['team'],
      'name': widget.data['nama_lengkap'],
      'time': widget.date.toString(),
      'pos': this.preferences?.getInt('timekeeper')
    };

    final dataItem = {
      'team': item['team'],
      'name': item['nama_lengkap'],
      'time': DateTime.parse(item['time']),
      'pos': item['pos']
    };
    final formData = FormData.fromMap(item);
    /* String encodedData = json.encode(_fifoList);
    await this.preferences!.setString('list', encodedData);
    print('asd' + encodedData.toString());
    while (_fifoList.isNotEmpty) {
      var item;
      try {
        item = _fifoList.removeAt(0);

        final formData = FormData.fromMap(item);
        result = await DataService().createResult(data: formData);
      } on DioError catch (e) {
        _fifoList.add(item);
        String encodedData = json.encode(_fifoList);
        await this.preferences!.setString('list', encodedData);
        debugPrint(e.message);
        break;
      }
    } */

    try {
      result = await DataService().createResult(data: formData);
      print('finish');

      setState(() {
        _isLoading:
        false;
      });
      _isLoading = false;
      nextScreen(context, ResultPage(result: result));
    } on DioError catch (e) {
      String listJson = this.preferences!.getString('list') ?? '[]';
      _fifoList = List.from(jsonDecode(listJson));
      _fifoList.add(item);
      String encodedData = json.encode(_fifoList);
      await this.preferences!.setString('list', encodedData);
      debugPrint('Error' + e.message);
      _isLoading = false;
    }
    /* result = await DataService().createResult(data: formData);
    print('finish');

    setState(() {
      _isLoading:
      false;
    });
    _isLoading = false;
    nextScreen(context, ResultPage(result: result)); */
  }
}
