// Words Quiz
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:words_quiz/models/my_theme_provider.dart';
import 'package:words_quiz/controllers/question_controller.dart';

import '../../size_config.dart';
import './components/body.dart';


class QuizScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _QuizScreenState();
}


class _QuizScreenState extends State<QuizScreen> {
  QuestionController _controller = Get.put(QuestionController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(context),
      body: Body(),
      resizeToAvoidBottomInset: false, // RenderFlex error solution
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
          text:"Words Quiz",
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
}
