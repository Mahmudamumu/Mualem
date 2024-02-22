import 'package:flutter/material.dart';
import 'package:quiz/Screens/quiz/QuizHome.dart';
import 'package:quiz/Screens/quiz/quizData.dart';
import 'HomeScreen.dart';

class quiz extends StatelessWidget {
  final List<Map<String, dynamic>> itemList = [
    {
      'image': 'assets/items/alphabet.jpg',
      'title': 'Alphabet',
      'action': () => QuizHome(
            title: "Alphabet",
            quizQuestions1: quizDataQue[0],
            quizNo: "Quiz_1",
          ),
    },
    {
      'image': 'assets/items/numbers.jpg',
      'title': 'Number',
      'action': () => QuizHome(
          title: "Number", quizQuestions1: quizDataQue[1], quizNo: "Quiz_2"),
    },
    {
      'image': 'assets/items/days.jpg',
      'title': 'Day',
      'action': () => QuizHome(
          title: "Day", quizQuestions1: quizDataQue[2], quizNo: "Quiz_3"),
    },
    {
      'image': 'assets/items/months.jpg',
      'title': 'Month',
      'action': () => QuizHome(
          title: "Month", quizQuestions1: quizDataQue[3], quizNo: "Quiz_4"),
    },
    {
      'image': 'assets/items/colour.jpg',
      'title': 'Colour',
      'action': () => QuizHome(
          title: "Colour", quizQuestions1: quizDataQue[4], quizNo: "Quiz_5"),
    },
    {
      'image': 'assets/items/animals.jpg',
      'title': 'Animal',
      'action': () => QuizHome(
          title: "Animal", quizQuestions1: quizDataQue[5], quizNo: "Quiz_6"),
    },
    {
      'image': 'assets/items/fruits.jpg',
      'title': 'Fruit',
      'action': () => QuizHome(
          title: "Fruit", quizQuestions1: quizDataQue[6], quizNo: "Quiz_7"),
    },
    {
      'image': 'assets/items/veg.png',
      'title': 'Vegetables',
      'action': () => QuizHome(
          title: "Vegetables",
          quizQuestions1: quizDataQue[7],
          quizNo: "Quiz_8"),
    },
  ];

  quiz({Key? key}) : super(key: key);

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
          MaterialPageRoute(builder: (context) => HomeScreen(index: 0)),
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
