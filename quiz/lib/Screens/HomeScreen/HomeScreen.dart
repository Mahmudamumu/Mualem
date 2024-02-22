import 'package:flutter/material.dart';
import 'package:quiz/constants.dart';
import 'quiz.dart';
import 'learning.dart';
import 'NavBar.dart';

class HomeScreen extends StatelessWidget {
  int index;
  HomeScreen({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          title: const Text('Mualem'),
          backgroundColor: kPrimaryColor,
        ),
        body: DefaultTabController(
          initialIndex: index,
          length: 2,
          child: Column(
            children: [
              Material(
                child: Container(
                  height: 60,
                  color: Colors.white,
                  child: TabBar(
                    physics: const ClampingScrollPhysics(),
                    padding: EdgeInsets.only(
                        top: 10, left: 10, right: 10, bottom: 10),
                    unselectedLabelColor: kPrimaryColor,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: kPrimaryColor),
                    tabs: [
                      Tab(
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border:
                                  Border.all(color: kPrimaryColor, width: 1)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("learn"),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border:
                                  Border.all(color: kPrimaryColor, width: 1)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("Quiz"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    learning(),
                    quiz(),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}
