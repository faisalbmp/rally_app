import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timed_rally_app/pages/HomePage.dart';
import 'package:timed_rally_app/service/data_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool isOnline = false;
  SharedPreferences preferences = await SharedPreferences.getInstance();
  final options = BaseOptions(
    baseUrl: 'https://rally.adhipati.org/api',
    connectTimeout: 5000,
    receiveTimeout: 3000,
    // headers: {"Authorization": "token 467022ae75460d8:78226a100ebe00b"}
  );
  final Dio _dio = Dio(options);
  // Get initial connectivity status
  ConnectivityResult connectivityResult =
      await Connectivity().checkConnectivity();
  // run periodic tes
  Timer.periodic(new Duration(seconds: 30), (timer) async {
    isOnline = false;
    try {
      Response res = await _dio.get('/test');
      print('res' + res.data.toString());
      isOnline = res.data != null;
    } on DioError catch (_) {
      print('Error :' + _.message);
      isOnline = false;
    }
    if (isOnline) {
      preferences.setBool('periodicRunning', true);

      List _fifoList = [];
      String listJson = preferences!.getString('list') ?? '[]';
      _fifoList = List.from(jsonDecode(listJson));

      while (_fifoList.isNotEmpty) {
        var item;
        try {
          listJson = preferences!.getString('list') ?? '[]';
          _fifoList = List.from(jsonDecode(listJson));

          item = _fifoList.removeAt(0);

          final formData = FormData.fromMap(item);
          await DataService().createResult(data: formData);

          String encodedData = json.encode(_fifoList);
          await preferences!.setString('list', encodedData);
        } on DioError catch (e) {
          /* _fifoList.add(item);
          String encodedData = json.encode(_fifoList);
          await preferences!.setString('list', encodedData); */
          debugPrint(e.message);
          break;
        }
      }
      preferences.setBool('periodicRunning', true);
    }
    print('online :' + isOnline.toString());
  });
  // Listen for connectivity changes
  /* Connectivity().onConnectivityChanged.listen((result) async {
    isOnline = false;
    try {
      Response res = await _dio.get('/test');
      print('res' + res.data.toString());
      isOnline = res.data != null;
    } on DioError catch (_) {
      print('Error :' + _.message);
      isOnline = false;
    }
    print('online :' + isOnline.toString());
    connectivityResult = result;
  }); */
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
