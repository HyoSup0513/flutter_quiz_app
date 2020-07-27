import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/model/model_quiz.dart';
import 'package:flutter_app/screen/screen_quiz.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Quiz> quizs = [
    Quiz.fromMap({
      'title': 'test',
      'candidates' : ['a','b','c','d'],
      'answer' : 0
    }),
    Quiz.fromMap({
      'title': 'test',
      'candidates' : ['a','b','c','d'],
      'answer' : 0
    }),
    Quiz.fromMap({
      'title': 'test',
      'candidates' : ['a','b','c','d'],
      'answer' : 0
    }),
  ];

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return WillPopScope(
        onWillPop: () async => false,
    child: SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Quiz APP"),
          backgroundColor: Colors.deepOrange,
          leading: Container(),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Image.asset('images/quiz.jpg', width: width * 0.8),
            ),
            Padding(
              padding: EdgeInsets.all(width * 0.024),
            ),
            Text(
              "Quiz APP",
              style: TextStyle(
                fontSize: width * 0.065,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Guidelines before solving a quiz.",
              textAlign: TextAlign.center,
            ),
            Padding(padding: EdgeInsets.all(width * 0.048)),
            _buildStep(width, "Solve three random quizzes."),
            _buildStep(width,
                "Please read the question carefully."),
            _buildStep(width,
                " Choose the correct answer,\n then press the Next question button."),
//            Padding(padding: EdgeInsets.all(width * 0.048)),
            Container(
              padding: EdgeInsets.only(bottom: width * 0.036),
              child: Center(
                child: ButtonTheme(
                  minWidth: width * 0.8,
                  height: height * 0.05,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: RaisedButton(
                    child: Text(
                      "Start Quiz!",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.deepOrange,
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>QuizScreen(quizs:quizs)));
                    },
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    )
    );
  }

  Widget _buildStep(double width, String title) {
    return Container(
      padding: EdgeInsets.fromLTRB(
          width * 0.048, width * 0.024, width * 0.048, width * 0.024),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.check_box,
            size: width * 0.04,
          ),
          Padding(padding: EdgeInsets.only(right: width * 0.024)),
          Text(title),
        ],
      ),
    );
  }
}
