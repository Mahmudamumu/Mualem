import 'package:flutter/material.dart';
import 'package:quiz/Screens/HomeScreen/HomeScreen.dart';
import 'package:quiz/constants.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';
import 'QuizQuestion.dart';
import 'quizData.dart';
import 'result.dart';

class QuizHome extends StatefulWidget {
  String title;
  List<QuizQuestion> quizQuestions1;
  String quizNo;

  QuizHome(
      {Key? key,
      required this.title,
      required this.quizQuestions1,
      required this.quizNo})
      : super(key: key);

  @override
  _QuizHomeState createState() => _QuizHomeState();
}

class _QuizHomeState extends State<QuizHome> {
  int _numberOfHearts = 3; // initial number of hearts

  bool iconVisibility = false;

  String iconPath = "assets/images/writeAns.png";

  int _selectedBoxIndex = -1; // initialize selected box index to -1

  int currentQuestionIndex = 0;

  // final List<QuizQuestion> quizQuestions = widget.quizQuestions1;

  void _selectBox(int index) {
    setState(() {
      _selectedBoxIndex =
          index; // set the selected box index to the given index
    });
  }

  void _incrementHearts() {
    setState(() {
      _numberOfHearts++; // increment the number of hearts
    });
  }

  void _decrementHearts() {
    setState(() {
      _numberOfHearts--; // decrement the number of hearts
    });
  }

  final AudioPlayer _audioPlayer = AudioPlayer();

  //music
  String questionSound = 'assets/animal/soundAnimal1.mp3';
  //text
  String que = "Question";
  //path of image

  String option1 = "assets/animal/Animal1.jpg";
  String option2 = "assets/animal/Animal1.jpg";
  String option3 = "assets/animal/Animal1.jpg";
  String option4 = "assets/animal/Animal1.jpg";

  //answer option number (0-3)
  int correct_answer = 0;
  //
  int totalPoint = 0;
  void _playAudio(String filePath) async {
    await _audioPlayer.stop();
    String audioasset = filePath;
    ByteData bytes = await rootBundle.load(audioasset); //load audio from assets
    Uint8List audiobytes =
        bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    int result = await _audioPlayer.playBytes(audiobytes);
    if (result == 1) {
      //play success
      print("audio is playing.");
    } else {
      print("Error while playing audio.");
    }
  }

  void _submitAnswer() {
    if (_selectedBoxIndex ==
        widget.quizQuestions1[currentQuestionIndex].correctAnswerIndex) {
      totalPoint++;

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Correct Answer!"),
        duration: Duration(seconds: 2),
      ));

      // iconVisibility = true;
      // iconPath = "assets/images/writeAns.png";
      // void waitFunction() async {
      //   await Future.delayed(Duration(seconds: 2)); // Wait for 2 seconds
      // }
    } else {
      //iconVisibility = true;
      //iconPath = "assets/images/wrongAns.png";
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Wrong Answer!"),
        duration: Duration(seconds: 2),
      ));
      _decrementHearts();
      // void waitFunction() async {
      //   await Future.delayed(Duration(seconds: 2)); // Wait for 2 seconds
      //   print("wait");
      // }
    }

    currentQuestionIndex++; // Move onto next question

    if (currentQuestionIndex < widget.quizQuestions1.length) {
      // Load next question and reset selected index
      final nextQuestion = widget.quizQuestions1[currentQuestionIndex];
      setState(() {
        // iconVisibility = false;

        que = nextQuestion.questionText;
        option1 = nextQuestion.options[0];
        option2 = nextQuestion.options[1];
        option3 = nextQuestion.options[2];
        option4 = nextQuestion.options[3];
        questionSound = nextQuestion.soundPath;
      });

      _selectedBoxIndex = -1; // Clear selection for next question
      // _playAudio(nextQuestion.soundPath); // Play audio for next question
    } else {
      // Quiz is completed
      // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      //   content: Text("Quiz completed!"),
      //   duration: Duration(seconds: 2),
      // ));
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => result(
                  score: totalPoint.toString(),
                  totalQue: widget.quizQuestions1.length.toString(),
                  quizNo: widget.quizNo,
                )),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (currentQuestionIndex < widget.quizQuestions1.length) {
      que = widget.quizQuestions1[currentQuestionIndex].questionText;

      option1 = widget.quizQuestions1[currentQuestionIndex].options[0];
      option2 = widget.quizQuestions1[currentQuestionIndex].options[1];
      option3 = widget.quizQuestions1[currentQuestionIndex].options[2];
      option4 = widget.quizQuestions1[currentQuestionIndex].options[3];
      questionSound = widget.quizQuestions1[currentQuestionIndex].soundPath;
    } else {}
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
            title: Text(widget.title),
            actions: [
              Row(
                children: [
                  Visibility(
                    visible: false,
                    child: Text(
                      '$_numberOfHearts', // display the number of hearts as text
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ), // add some space between the text and the icon
                  Visibility(
                    visible: false,
                    child: Icon(
                      Icons.favorite, // use the heart icon
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ), // add some space on the right side of the icon
                ],
              ),
            ],
          ),
          body: Padding(
            padding: EdgeInsets.all(16.0), // Increase top and bottom padding

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.width * 0.1),
                  child: Row(
                    children: [
                      Container(
                        height: 50,
                        padding: EdgeInsets.all(8.0),
                        decoration: BoxDecoration(
                          color: kPrimaryLightColor,
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            print('taped');

                            _playAudio(questionSound);
                          },
                          child: Icon(Icons.volume_up),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        // Make the text container fill the remaining space
                        child: Container(
                          height: 50,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color: kPrimaryLightColor,
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          padding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          child: Text(
                            que, // add some text to the Container
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Add your other widgets here
                Container(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.width * 0.1),
                  alignment: Alignment.center,
                  child: Text(
                    'Select your answer!', // add some text to the Container
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.width * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(24.0),
                    color: kPrimaryLightColor,
                  ),
                  child: Stack(
                    children: [
                      Positioned(
                        top: MediaQuery.of(context).size.width * 0.07,
                        left: MediaQuery.of(context).size.width * 0.07,
//
                        child: GestureDetector(
                          onTap: () {
                            _selectBox(0); // select the first box
                          },

//
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: MediaQuery.of(context).size.width * 0.35,
                            decoration: BoxDecoration(
                              //color: Colors.red,
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                color: _selectedBoxIndex == 0
                                    ? Colors.red
                                    : Colors.white,
                                // color: Colors.red, // set the border color to red
                                width: 3.0,
                              ),
                            ),

                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.asset(
                                option1,
                                fit: BoxFit.fill,
                              ),
                            ), // add an image to the container add an image to the container
                          ),
                        ),
                      ),
                      Positioned(
                        top: MediaQuery.of(context).size.width * 0.07,
                        right: MediaQuery.of(context).size.width * 0.07,
                        child: GestureDetector(
                          onTap: () {
                            _selectBox(1); // select the first box
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: MediaQuery.of(context).size.width * 0.35,
                            decoration: BoxDecoration(
                              //color: Colors.green,
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                color: _selectedBoxIndex == 1
                                    ? Colors.green
                                    : Colors.white,
                                //color: Colors.green, // set the border color to green
                                width: 3.0,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.asset(
                                option2,
                                fit: BoxFit.fill,
                              ),
                            ), // add an image to the container
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: MediaQuery.of(context).size.width * 0.07,
                        left: MediaQuery.of(context).size.width * 0.07,
                        child: GestureDetector(
                          onTap: () {
                            _selectBox(2); // select the first box
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: MediaQuery.of(context).size.width * 0.35,
                            decoration: BoxDecoration(
                              //color: Colors.blue,
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                color: _selectedBoxIndex == 2
                                    ? Colors.blue
                                    : Colors
                                        .white, // set the border color to blue
                                width: 3.0,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.asset(
                                option3,
                                fit: BoxFit.fill,
                              ),
                            ), // add an image to the container
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: MediaQuery.of(context).size.width * 0.07,
                        right: MediaQuery.of(context).size.width * 0.07,
                        child: GestureDetector(
                          onTap: () {
                            _selectBox(3); // select the first box
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.35,
                            height: MediaQuery.of(context).size.width * 0.35,
                            decoration: BoxDecoration(
                              // color: Colors.yellow,
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                color: _selectedBoxIndex == 3
                                    ? Colors.yellow
                                    : Colors
                                        .white, // set the border color to yellow
                                width: 3.0,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20.0),
                              child: Image.asset(
                                option4,
                                fit: BoxFit.fill,
                              ),
                            ), // add an image to the container add an image to the container
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Container(
                  child: Column(
                    children: [
                      Visibility(
                        visible: iconVisibility,
                        child: Image.asset(
                          iconPath,
                          fit: BoxFit.fill,
                          height: 80,
                          width: 80,
                        ),
                      ),
                    ],
                  ),
                ),
                // add an
                Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      _submitAnswer();
                      // if (_selectedBoxIndex == correct_answer) {
                      //   totalPoint++;
                      // } else {
                      //   _decrementHearts();
                      // }
                      //
                    },
                    child: Text('Submit'),
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
        ));
  }
}
