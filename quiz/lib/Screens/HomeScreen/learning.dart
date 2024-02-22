import 'package:flutter/material.dart';
import 'package:quiz/Screens/Login/login_screen.dart';
import 'package:quiz/Screens/learn/LearnHome.dart';
import 'package:quiz/Screens/data/datas.dart';

class learning extends StatelessWidget {
  final List<Map<String, dynamic>> itemList = [
    {
      'image': 'assets/items/alphabet.jpg',
      'title': 'Alphabet',
      'action': () => LearnHome(title: 'Alphabet', mydata: datas[0]),
    },
    {
      'image': 'assets/items/numbers.jpg',
      'title': 'Number',
      'action': () => LearnHome(title: 'Number', mydata: datas[1]),
    },
    {
      'image': 'assets/items/days.jpg',
      'title': 'Day',
      'action': () => LearnHome(title: 'Day', mydata: datas[3]),
    },
    {
      'image': 'assets/items/months.jpg',
      'title': 'Month',
      'action': () => LearnHome(title: 'Month', mydata: datas[2]),
    },
    {
      'image': 'assets/items/colour.jpg',
      'title': 'Colour',
      'action': () => LearnHome(title: 'Colour', mydata: datas[4]),
    },
    {
      'image': 'assets/items/animals.jpg',
      'title': 'Animal',
      'action': () => LearnHome(title: 'Animal', mydata: datas[5]),
    },
    {
      'image': 'assets/items/fruits.jpg',
      'title': 'Fruit',
      'action': () => LearnHome(title: 'Fruit', mydata: datas[6]),
    },
    {
      'image': 'assets/items/veg.png',
      'title': 'Vegetables',
      'action': () => LearnHome(title: 'Vegetables', mydata: datas[7]),
    },
  ];

  learning({Key? key}) : super(key: key);

  void _handleItemClick(int index, BuildContext context) {
    // Call action for this item when tapped
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => itemList[index]['action']()),
    );
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
        body: GridView.builder(
          padding: EdgeInsets.all(15),
          itemCount: itemList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 25,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => _handleItemClick(index, context),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(15)),
                      child: Image.asset(
                        itemList[index]['image'],
                        width: double.infinity,
                        height: 120,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 7),
                    Text(
                      itemList[index]['title'],
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
