import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_app/model/model_quiz.dart';
import 'package:flutter_app/screen/screen_home.dart';

class ResultScreen extends StatelessWidget{
  List<int> answers;
  List<Quiz> quizs;
  ResultScreen({this.answers, this.quizs});

  @override
  Widget build(BuildContext context){
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    int score = 0;
    for (int i=0; i<quizs.length; i++){
      if(quizs[i].answer == answers[i]){
      score += 1;
      }
    }
    return WillPopScope(
        onWillPop: () async => false,
    child: SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("My Quiz APP"),
          backgroundColor: Colors.deepOrange,
          leading: Container(),
        ),
        body: Center(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.deepOrange),
              color: Colors.deepOrange,
            ),
            width: width * 0.85,
            height: height * 0.5,
            child: Column(
              children: <Widget>[
                Padding(padding: EdgeInsets.only(bottom: width * 0.048),),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.deepOrange),
                    color: Colors.white,
                  ),
                  width: width * 0.73,
                  height: height * 0.34,
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.fromLTRB(0, width * 0.048, 0, width * 0.012),
                        child: Text(
                          "Finished !",
                          style: TextStyle(
                            fontSize: width * 0.055,
                            fontWeight: FontWeight.bold,
                          )
                        )
                      ),
                      Text("Your score is",
                          style: TextStyle(
                            fontSize: width * 0.048,
                            fontWeight: FontWeight.bold,
                          )
                      ),
                      Expanded(child: Container(),
                      ),
                      Text(
                          score.toString() + '/' + quizs.length.toString(),
                          style: TextStyle(
                            fontSize: width * 0.21,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber,
                          ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(width * 0.015),
                      )
                    ],
                  )
                ),
                Expanded(
                    child:Container()
                ),
                Container(
                  padding: EdgeInsets.only(bottom: width * 0.048),
                  child: ButtonTheme(
                    minWidth: width * 0.73,
                    height: height * 0.05,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),
                    ),
                    child: RaisedButton(onPressed: (){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context){
                        return HomeScreen();
                      }));
                    },
                      child: Text('Return to Home'),
                      color: Colors.white,
                      textColor: Colors.black,
                    ),
                  ),
                ),
              ],
            )
          )
        ),
      ),
    )
    );
  }
}