import 'package:flutter/material.dart';
import 'package:quiz/Screens/HomeScreen/HomeScreen.dart';
import 'package:quiz/Screens/HomeScreen/NavBar.dart';
import 'package:quiz/constants.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';

class LearnHome extends StatefulWidget {
  String title;
  List<Map<String, dynamic>> mydata;

  LearnHome({Key? key, required this.title, required this.mydata})
      : super(key: key);

  @override
  _LearnHomeState createState() => _LearnHomeState();
}

class _LearnHomeState extends State<LearnHome> {
  // Create a list of data to display

  int _currentIndex = 0;

  final AudioPlayer _audioPlayer = AudioPlayer();

  void _playAudio(String filePath) async {
    await _audioPlayer.stop();

    // player.play(filePath);
    //await _audioPlayer.play(filePath);
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

  void _nextItem() {
    setState(() {
      if (_currentIndex < widget.mydata.length - 1) {
        _currentIndex++;
      }
    });
  }

  void _previousItem() {
    setState(() {
      if (_currentIndex > 0) {
        _currentIndex--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> currentData = widget.mydata[_currentIndex];

    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => HomeScreen(
                    index: 0,
                  )),
        );
        return false;
      },
      child: Scaffold(
        drawer: NavBar(),
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: kPrimaryColor,
        ),
        body: Stack(
          children: [
            Container(
//

//
              decoration: BoxDecoration(
                color: kPrimaryLightColor,
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          currentData['image'],
                          fit: BoxFit.fill,
                          //fit: BoxFit.cover,

                          height: MediaQuery.of(context).size.width * 1.0,
                          width: MediaQuery.of(context).size.width * 0.8,
                        ),
                      ),
                      SizedBox(height: 25),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 60,
                        child: Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                print('taped');

                                _playAudio(currentData['audio']);
                              },
                              child: Icon(Icons.volume_up, color: Colors.grey),
                            ),
                            SizedBox(width: 15),
                            Text(
                              currentData['text'],
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(width: 35),
                            Flexible(
                              child: ElevatedButton(
                                child: Text('Previous'),
                                onPressed: _previousItem,
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          20), // add padding to the button
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 35),
                            Flexible(
                              child: ElevatedButton(
                                child: Text('Next'),
                                onPressed: _nextItem,
                                style: ElevatedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                          20), // add padding to the button
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(width: 35),
                          ],
                        ),
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
