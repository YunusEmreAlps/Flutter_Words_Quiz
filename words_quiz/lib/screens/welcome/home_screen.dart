// Words Quiz
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:words_quiz/size_config.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:words_quiz/models/my_theme_provider.dart';

import './components/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // we have to call this on our starting page
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildAppBar(context),
      body: Body(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        "Words Quiz",
        style: TextStyle(
          color: Theme.of(context).accentColor,
          fontSize: 22, // 22
          fontFamily: 'NexaLight',
          letterSpacing: 2,
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
