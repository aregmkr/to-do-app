import 'package:flutter/material.dart';
import 'package:trying_learn/theme/theme_provider.dart';
import 'package:trying_learn/widgets/app.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(create: (context) => ThemeProvider(),
    child: const App(),
    ),
  );
}