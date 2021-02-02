// Words Quiz
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:words_quiz/theme.dart';
import 'package:provider/provider.dart';
import 'package:words_quiz/models/my_theme_provider.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import './screens/welcome/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Portrait mode
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ChangeNotifierProvider(
      create: (context) => MyThemeModel(),
      child: Consumer<MyThemeModel>(
        builder: (context, theme, child) => GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Words Quiz',
          theme: themeData(context),
          darkTheme: darkThemeData(context),
          themeMode: theme.isLightTheme ? ThemeMode.light : ThemeMode.dark,
          home: HomeScreen(),
        ),
      ),
    );
  }
}
