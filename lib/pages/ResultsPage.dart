import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timed_rally_app/model/resultModel.dart';
import 'package:timed_rally_app/pages/HomePage.dart';
import 'package:timed_rally_app/pages/ResultPage.dart';
import 'package:timed_rally_app/service/data_service.dart';
import 'package:timed_rally_app/widget/widget.dart';

class ResultsPage extends StatefulWidget {
  const ResultsPage({super.key});

  @override
  State<ResultsPage> createState() => _ResultsPageState();
}

class _ResultsPageState extends State<ResultsPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = "";
  SharedPreferences? preferences;
  List<ResultModel> resultList = [];
  List<ResultModel> results = [];
  @override
  void initState() {
    super.initState();
    DataService().getResults().then(
      (value) {
        setState(() {
          this.resultList.addAll(value);
          this.results.addAll(value);
        });
      },
    );
    /* setState(() {
      resultList:
      results;
    }); */
    /* getresults().whenComplete(() {
      setState(() {
        resultList:
        this.results;
      });
    }); */
    /* getresults().whenComplete(() {
      setState(() {
        results:
        this.results;
        resultList:
        this.results;
      });
    });
    ; */
    /* setState(() {
      resultList:
      results;
    }); */
    initializePreference().whenComplete(() {
      setState(() {});
    });
  }

  /* Future<void> getresults() async {
    List<ResultModel> res = await DataService().getResults();
    return res;
  } */

  Future<void> initializePreference() async {
    this.preferences = await SharedPreferences.getInstance();
  }

  void filterSearchResults(String query) {
    List<ResultModel> dummySearchList = [];
    dummySearchList.addAll(results);
    if (query.isNotEmpty) {
      List<ResultModel> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.nama_lengkap.toLowerCase().contains(query.toLowerCase()) ||
            item.team.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        // this.results.clear();
        this.resultList.clear();
        this.resultList.addAll(dummyListData);
        // this.results.addAll(dummySearchList);
      });
      return;
    } else {
      setState(() {
        this.resultList.clear();
        // this.results.clear();
        this.resultList.addAll(dummySearchList);
        // this.results.addAll(dummySearchList);
      });
    }
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
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) {
                  filterSearchResults(value);
                },
                controller: _searchController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Cari Peserta.."),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: this.resultList!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        nextScreen(context,
                            ResultPage(result: this.resultList![index]));
                      },
                      child: ListTile(
                        title: Text(this.resultList![index].team),
                        subtitle: Text(this.resultList![index].nama_lengkap),
                        trailing: Text(
                            this.resultList![index].scoretotal.toString(),
                            style: TextStyle(fontSize: 30)),
                        leading: Text(
                          '${index + 1}',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    );
                  },
                ),
                /* child: FutureBuilder(
                future: DataService().getResults(),
                builder: (context, AsyncSnapshot<List<ResultModel>> snapshot) {
                  Widget children;
                  if (snapshot.hasData) {
                    children = ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        Widget child;
                        if (_searchText != '' ||
                            snapshot.data![index].team
                                .contains(_searchText.toString())) {
                          child = GestureDetector(
                            onTap: () {
                              nextScreen(context,
                                  ResultPage(result: snapshot.data![index]));
                            },
                            child: ListTile(
                              title: Text(snapshot.data![index].team),
                              subtitle:
                                  Text(snapshot.data![index].nama_lengkap),
                              trailing: Icon(Icons.arrow_forward),
                            ),
                          );
                        } else {
                          child = SizedBox();
                        }
                        return child;
                      },
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
                  return Container(child: children);
                },
              ) */
              )
            ],
          ),
        ));
  }
}
