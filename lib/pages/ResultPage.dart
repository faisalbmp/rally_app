import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timed_rally_app/model/resultModel.dart';
import 'package:timed_rally_app/pages/HomePage.dart';
import 'package:timed_rally_app/pages/TimekeeperPage.dart';
import 'package:timed_rally_app/pages/UserPage.dart';
import 'package:timed_rally_app/service/data_service.dart';
import 'package:timed_rally_app/widget/widget.dart';

class ResultPage extends StatefulWidget {
  final ResultModel? result;
  const ResultPage({required this.result});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  SharedPreferences? preferences;
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
    return Scaffold(
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
            Text("Result Page"),
          ],
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFD1353F),
      ),
      body: FutureBuilder(
        future: DataService().getResult(id: widget.result!.id),
        builder: (context, AsyncSnapshot<ResultModel> snapshot) {
          Widget children;
          if (snapshot.hasData) {
            children = Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  decoration:
                      BoxDecoration(color: Color.fromARGB(247, 230, 230, 230)),
                  child: Text(
                    'Nama :\n${snapshot.data!.nama_lengkap}',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  decoration:
                      BoxDecoration(color: Color.fromARGB(247, 230, 230, 230)),
                  child: Text(
                    'Team :\n ${snapshot.data!.team}',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  decoration:
                      BoxDecoration(color: Color.fromARGB(247, 230, 230, 230)),
                  child: Text(
                    style: TextStyle(fontSize: 20),
                    'Start Pos :\n ${formatDate(snapshot.data!.start_time) ?? "-"}',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  decoration:
                      BoxDecoration(color: Color.fromARGB(247, 230, 230, 230)),
                  child: Text(
                    style: TextStyle(fontSize: 20),
                    'Pos 1 :\n ${formatDate(snapshot.data!.time_pos1) ?? "-"}',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  decoration:
                      BoxDecoration(color: Color.fromARGB(247, 230, 230, 230)),
                  child: Text(
                    style: TextStyle(fontSize: 20),
                    'Pos 2 :\n ${formatDate(snapshot.data!.time_pos2) ?? "-"}',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  decoration:
                      BoxDecoration(color: Color.fromARGB(247, 230, 230, 230)),
                  child: Text(
                    style: TextStyle(fontSize: 20),
                    'Pos 3 :\n ${formatDate(snapshot.data!.time_pos3) ?? "-"}',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width,
                  decoration:
                      BoxDecoration(color: Color.fromARGB(247, 230, 230, 230)),
                  child: Text(
                    style: TextStyle(fontSize: 20),
                    'Finish  Pos:\n ${formatDate(snapshot.data!.time_finish) ?? "-"}',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
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
                        builder: (context) => const TimekeeperPage(),
                      ));
                    },
                    child: const Text(
                      'Back',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ],
            );
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
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: children,
          );
        },
      ),
    );
  }

  formatDate(DateTime? date) {
    return date != null ? '${date!.hour}:${date!.minute}' : '-';
  }
}
