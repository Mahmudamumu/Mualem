import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:quiz/Screens/HomeScreen/EditProfilePage.dart';
import 'package:quiz/Screens/Login/login_screen.dart';
import 'package:quiz/Screens/admin/adminHome.dart';
import 'package:quiz/Screens/HomeScreen/HomeScreen.dart';
import 'package:quiz/components/progressScreen/MyProgressScreen.dart';
import 'package:quiz/Screens/quiz/QuizHome.dart';
import 'package:quiz/Screens/quiz/quizData.dart';
import 'package:quiz/components/DialugeBox/CurvedDialog.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  String _fname = '';
  String _lname = '';
  String _email = '';
  bool _mounted = false;

  Future<void> retrieveData() async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    final User? user = auth.currentUser;
    String uId = '';

    if (user != null) {
      uId = user.uid;
    }

    DatabaseReference ref =
        FirebaseDatabase.instance.ref('users/$uId/profile/firstName');
    DatabaseEvent event = await ref.once();
    _fname = event.snapshot.value.toString();

    DatabaseReference ref1 =
        FirebaseDatabase.instance.ref('users/$uId/profile/lastName');
    DatabaseEvent event1 = await ref1.once();
    _lname = event.snapshot.value.toString();

    DatabaseReference ref2 =
        FirebaseDatabase.instance.ref('users/$uId/profile/email');
    DatabaseEvent event2 = await ref2.once();
    _email = event.snapshot.value.toString();

    if (_mounted) {
      setState(() {
        _fname = event.snapshot.value.toString();
        _lname = event1.snapshot.value.toString();
        _email = event2.snapshot.value.toString();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _mounted = true;
    retrieveData();
  }

  @override
  void dispose() {
    _mounted = false;
    super.dispose();
  }

  void signOut(BuildContext context) async {
    final FirebaseAuth auth = FirebaseAuth.instance;
    await auth.signOut();

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    String name = "$_fname $_lname";
    String email = _email;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(name,
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
            accountEmail: Text(email,
                style:
                    TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/images/cover.png"),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.leaderboard),
            title: Text('My Progress'),
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MyProgressScreen()),
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Learn'),
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(
                  index: 0,
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.quiz),
            title: Text('Quiz'),
            onTap: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(
                  index: 1,
                ),
              ),
            ),
          ),
          Divider(),
          ListTile(
            title: Text('Sign Out'),
            leading: Icon(Icons.exit_to_app),
            onTap: () => signOut(context),
          ),
        ],
      ),
    );
  }
}
