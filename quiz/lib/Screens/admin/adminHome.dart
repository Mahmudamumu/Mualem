import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:quiz/Screens/HomeScreen/HomeScreen.dart';
import 'package:quiz/Screens/Login/login_screen.dart';
import 'package:quiz/Screens/admin/learnerDetails.dart';

class adminHome extends StatefulWidget {
  @override
  _adminHomeState createState() => _adminHomeState();
}

class _adminHomeState extends State<adminHome> {
  List<String> uid = [];
  List<String> firstName = [];
  List<String> lastName = [];

  void initState() {
    super.initState();
    getUserIds();
  }

  void getUserIds() async {
    DatabaseReference userRef =
        FirebaseDatabase.instance.reference().child('users');
    userRef.onValue.listen((event) {
      DataSnapshot dataSnapshot = event.snapshot;

      Map<dynamic, dynamic>? users =
          dataSnapshot.value as Map<dynamic, dynamic>?;
      if (users != null) {
        users.forEach((key, value) {
          uid.add(key);
        });
        getUsername(); // Call getUsername() after getting user IDs
      }
      setState(() {});
    });
  }

  void getUsername() async {
    DatabaseReference userRef =
        FirebaseDatabase.instance.reference().child('users');
    userRef.onValue.listen((event) {
      DataSnapshot dataSnapshot = event.snapshot;

      Map<dynamic, dynamic>? usersMap =
          dataSnapshot.value as Map<dynamic, dynamic>?;
      if (usersMap != null) {
        usersMap.forEach((key, value) {
          String? userFirstName = value['profile']['firstName'];
          String? userLastName = value['profile']['lastName'];
          if (userFirstName != null) {
            firstName.add(userFirstName);
          }
          if (userLastName != null) {
            lastName.add(userLastName);
          }
        });
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );

        return true; // Return true to allow the back navigation
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Catty Quiz Admin'),
        ),
        body: Column(
          children: [
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Learners",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue, // <-- You need to define this color
                  letterSpacing: 1.5,
                ),
              ),
            ),
            SizedBox(height: 16),
            Flexible(
              child: ListView.builder(
                itemCount: uid.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                learnerDetails(uids: uid[index])),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        color: Color.fromARGB(255, 237, 132, 100),
                        height: 60,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '${firstName[index]} ${lastName[index]}',
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
