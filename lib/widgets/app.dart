import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trying_learn/screens/home_screen.dart';
import 'package:trying_learn/screens/main_screen.dart';
import 'package:trying_learn/screens/settings_screen.dart';
import 'package:trying_learn/theme/theme.dart';
import 'package:trying_learn/theme/theme_provider.dart';
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "To-Do List",
      home: MainScreen(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}

