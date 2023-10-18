/* import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  
  void _loadFifoList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String listJson = prefs.getString('fifo_list') ?? '[]';
    setState(() {
      _fifoList = List<String>.from(jsonDecode(listJson));
    });
    _checkInternetConnection();
  }

  void _saveFifoList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String listJson = jsonEncode(_fifoList);
    await prefs.setString('fifo_list', listJson);
  }

  void _enqueue(String item) {
    setState(() {
      _fifoList.add(item);
    });
    _saveFifoList();
    _checkInternetConnection();
  }

  String _dequeue() {
    String item = _fifoList.removeAt(0);
    _saveFifoList();
    return item;
  }
  
  Future<void> _checkInternetConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      // _sendQueuedData();
    }
  }
} */