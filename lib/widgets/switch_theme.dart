import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trying_learn/theme/theme.dart';
import 'package:trying_learn/theme/theme_provider.dart';

class Switch_Theme extends StatefulWidget {
  const Switch_Theme({super.key});

  @override
  State<Switch_Theme> createState() => _Switch_ThemeState();
}

class _Switch_ThemeState extends State<Switch_Theme> {
  static const WidgetStateProperty<Icon> thumbIcon =
      WidgetStateProperty<Icon>.fromMap(
    <WidgetStatesConstraint, Icon>{
      WidgetState.selected: Icon(Icons.nightlight_round),
      WidgetState.any: Icon(Icons.sunny),
    },
  );

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            themeProvider.themeData == AppTheme.darkTheme
                ? "Dark Theme"
                : "Light Theme",
            style: const TextStyle(fontSize: 16),
          ),
        ),
        Switch(
          value: themeProvider.themeData == AppTheme.darkTheme,
          onChanged: (bool value) {
            themeProvider.toggleTheme();
          },
          thumbIcon: thumbIcon,
        ),
      ],
    );
  }
}
