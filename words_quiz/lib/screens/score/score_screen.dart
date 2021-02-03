import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:words_quiz/constants.dart';
import 'package:words_quiz/controllers/question_controller.dart';
import 'package:websafe_svg/websafe_svg.dart';
import 'package:words_quiz/models/my_theme_provider.dart';

import '../../size_config.dart';

class ScoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      appBar: buildAppBar(context),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Column(
            children: [
              Spacer(flex: 3),
              Text(
                "Score",
                style: Theme.of(context)
                    .textTheme
                    .headline3
                    .copyWith(color: kSecondaryColor),
              ),
              Spacer(),
              Text(
                "${_qnController.numOfCorrectAns * 10}/${_qnController.questions.length * 10}",
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: kSecondaryColor),
              ),
              Text(
                message(_qnController.numOfCorrectAns),
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(color: kSecondaryColor),
              ),
              Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }

  // Fluttter show the back button automatically
  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Text.rich(
        TextSpan(
          text: "Words Quiz",
          style: TextStyle(
            color: Theme.of(context).accentColor,
            fontSize: 22, // 22
            fontFamily: 'NexaLight',
            letterSpacing: 2,
          ),
        ),
      ),
      actions: [buildAddButton(context)],
    );
  }

  Padding buildAddButton(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
      child: Consumer<MyThemeModel>(
        builder: (context, theme, child) => InkWell(
          onTap: () => theme.changeTheme(),
          child: SvgPicture.asset(
            theme.isLightTheme
                ? "assets/icons/sun.svg"
                : "assets/icons/moon.svg",
            height: 22,
            width: 22,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }

  String message(int score) {
    if (score >= 81)
      return "You are awesome!";
    else if (score >= 61)
      return "Pretty likeable!";
    else if (score >= 41)
      return "You need to work more!";
    else if (score >= 21)
      return "You need to work hard!";
    else
      return "This is a poor score!";
  }
}
