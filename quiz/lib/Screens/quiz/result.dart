import 'package:flutter/material.dart';
import 'package:quiz/constants.dart';
import 'package:quiz/Screens/HomeScreen/HomeScreen.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class result extends StatelessWidget {
  final String score;
  final String totalQue;
  final String quizNo;

  result(
      {Key? key,
      required this.score,
      required this.totalQue,
      required this.quizNo})
      : super(key: key);

  void _updateDatabase() {
    User? user = FirebaseAuth.instance.currentUser;
    String uid = "null";
    if (user != null) {
      uid = user.uid;
    }

    FirebaseDatabase.instance
        .reference()
        .child('users/${uid}/user_results/${quizNo}')
        .set({
      'score': score,
      'total_questions': totalQue,
    });
  }

  @override
  Widget build(BuildContext context) {
    _updateDatabase();
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen(index: 1)),
        );

        return true; // Return true to allow the back navigation
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Result'),
        ),
        body: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(30),
                child: Image.asset("assets/items/welldone.png"),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Your Scored',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.all(30),
                  child: Text(
                    score,
                    style: TextStyle(
                      fontSize: 45,
                      fontWeight: FontWeight.bold,
                      color: kPrimaryColor,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Total Question Was $totalQue',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: kPrimaryColor,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.all(30),
                child: ElevatedButton(
                  onPressed: () {
                    // Update the database before navigating to the home screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => HomeScreen(index: 1)),
                    );
                  },
                  child: Text('Go To Home'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(20), // add padding to the button
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
