// Words Quiz
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:words_quiz/constants.dart';
import 'package:words_quiz/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:words_quiz/widgets/number_timer.dart';
import 'package:words_quiz/screens/quiz/quiz_screen.dart';

class Body extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ChallengeThreeScreenState();
}

class _ChallengeThreeScreenState extends State<Body> {
  bool loading = true;
  int current = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        alignment: Alignment.center,
        child: loading
            ? NumberTimer(onCompleted: () {
                setState(() {
                  this.loading = false;
                  current++;
                });
              })
            : InkWell(
                onTap: () => Navigator.of(context).push(new MaterialPageRoute(
                    builder: (BuildContext context) => new QuizScreen())),
                child: new Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Text(
                      "Let's Start Quiz",
                      style: new TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 40.0,
                          fontFamily: 'NexaLight',
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold),
                    ),
                    new Text(
                      "Tap to start!",
                      style: new TextStyle(
                          color: Theme.of(context).accentColor,
                          fontSize: 20.0,
                          fontFamily: 'NexaLight',
                          letterSpacing: 2,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
