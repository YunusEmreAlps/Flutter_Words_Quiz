import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:words_quiz/models/Questions.dart';
import 'package:words_quiz/controllers/question_controller.dart';

import 'option.dart';
import '../../../constants.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({
    Key key,
    // it means we have to pass this
    @required this.question,
  }) : super(key: key);

  final Question question;

  @override
  Widget build(BuildContext context) {
    QuestionController _controller = Get.put(QuestionController());
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Obx(
              () => Text.rich(
                TextSpan(
                  text: "${_controller.questionNumber.value}",
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 22, // 22
                    fontFamily: 'NexaLight',
                    letterSpacing: 2,
                  ),
                  children: [
                    TextSpan(
                      text: "/${_controller.questions.length}",
                      style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 22, // 22
                        fontFamily: 'NexaLight',
                        letterSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Divider(thickness: 0.5),
          SizedBox(height: kDefaultPadding / 4),
          Text(
            // What is the correct translation for "telephone"?
            "${question.question}",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headline6
                .copyWith(color: kSurfaceDarkColor),
          ),
          SizedBox(height: kDefaultPadding / 4),
          ...List.generate(
            question.options.length,
            (index) => Option(
              index: index,
              text: question.options[index],
              press: () => _controller.checkAns(question, index),
            ),
          ),
          SizedBox(height: kDefaultPadding / 2),
          SizedBox.fromSize(
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(right: 12.0),
              child: Text(
                "Score : ${_controller.numOfCorrectAns * 10}",
                style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
