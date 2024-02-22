import 'package:flutter/material.dart';
import 'package:quiz/Screens/admin/adminHome.dart';
import 'package:quiz/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class learnerDetails extends StatefulWidget {
  String uids;

  learnerDetails({
    Key? key,
    required this.uids,
  }) : super(key: key);
  @override
  _learnerDetailsState createState() => _learnerDetailsState();
}

class _learnerDetailsState extends State<learnerDetails> {
  List<Map<String, dynamic>> data = [];

  @override
  void initState() {
    super.initState();

    // Retrieve data from Firebase once on screen initialization
    retrieveData();
  }

  Future<void> retrieveData() async {
    // User? user = FirebaseAuth.instance.currentUser;
    String uid = widget.uids;
    // if (user != null) {
    //   uid = user.uid;
    // }

    DatabaseReference databaseReference =
        FirebaseDatabase.instance.reference().child('users/$uid/user_results');

    databaseReference.onValue.listen((event) {
      DataSnapshot dataSnapshot = event.snapshot;

      Map<dynamic, dynamic>? resultsMap =
          dataSnapshot.value as Map<dynamic, dynamic>?;

      List<Map<String, dynamic>> dataList = [];

      if (resultsMap != null) {
        for (var i = 1; i <= resultsMap.length; i++) {
          Map<String, dynamic> result = {};

          result['quizNumber'] = i.toString();
          result['score'] = resultsMap['Quiz_$i']['score'].toString();
          result['totalQuestions'] =
              resultsMap['Quiz_$i']['total_questions'].toString();

          dataList.add(result);
        }
      }

      setState(() {
        data = dataList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => adminHome()),
        );

        return true; // Return true to allow the back navigation
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Progress'),
        ),
        body: Column(
          children: [
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Here is progress",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: kPrimaryColor,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            SizedBox(height: 16),
            Flexible(
              child: data.isEmpty
                  ? Padding(
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.25),
                      child: Image.asset('assets/items/noResult.png'))
                  : ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) => ListTile(
                        title: Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                12), // Set the radius of the border here
                            child: Container(
                              color: Color.fromARGB(255, 110, 238, 134),
                              height: 60,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  // Quiz number text view
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    'Quiz ${data[index]['quizNumber']}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                  SizedBox(width: 7),

                                  // Linear progress bar
                                  Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.5,
                                    child: LinearProgressIndicator(
                                      minHeight: 7,
                                      value:
                                          double.parse(data[index]['score']) /
                                              double.parse(data[index]
                                                  ['totalQuestions']),
                                      backgroundColor: Colors.grey[300],
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          kPrimaryColor),
                                    ),
                                  ),
                                  SizedBox(width: 7),

                                  // Score text view
                                  Text(
                                    '${data[index]['score']}/${data[index]['totalQuestions']}',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
