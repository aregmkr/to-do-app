import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trying_learn/theme/theme.dart';
import 'package:trying_learn/theme/theme_provider.dart';
import 'package:trying_learn/widgets/switch_theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Settings")),
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Text(
                  "Customize",
                  style: TextStyle(color: Colors.deepPurpleAccent),
                ),
              ),
              Switch_Theme(),
            ],
          ),
        ],
      ),
    );
  }
}
