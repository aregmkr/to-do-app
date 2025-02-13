import 'package:flutter/material.dart';
import 'package:trying_learn/widgets/app.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Settings"),),
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Customsize", style: TextStyle(color: Colors.deepPurpleAccent),),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
