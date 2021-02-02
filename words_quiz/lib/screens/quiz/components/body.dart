import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:words_quiz/constants.dart';
import 'package:words_quiz/controllers/question_controller.dart';
import 'package:words_quiz/models/Questions.dart';

import 'progress_bar.dart';
import 'question_card.dart';

class Body extends StatefulWidget {
  final Question question;
  final Function onCompleted;
  const Body({
    Key key,
    @required this.question,
    @required this.onCompleted,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool answerable = true;
  bool answered = false;
  bool correct = false;
  bool showAnswer = false;
  String answer = '';
  Question question;
  @override
  void initState() {
    super.initState();
    question = widget.question;
  }

  /*const Body({
    Key key,
  }) : super(key: key);*/

  @override
  Widget build(BuildContext context) {
    // So that we have acccess our controller
    QuestionController _questionController = Get.put(QuestionController());
    return Stack(
      children: [
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: PageView.builder(
                  // Block swipe to next qn
                  physics: NeverScrollableScrollPhysics(),
                  controller: _questionController.pageController,
                  onPageChanged: _questionController.updateTheQnNum,
                  itemCount: _questionController.questions.length,
                  itemBuilder: (context, index) => QuestionCard(
                      question: _questionController.questions[index]),
                ),
              ),
              SizedBox(height: kDefaultPadding),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: ProgressBar(),
              ),
              SizedBox(height: kDefaultPadding),
            ],
          ),
        )
      ],
    );
  }
}
