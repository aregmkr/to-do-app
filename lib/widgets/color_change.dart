import 'package:flutter/material.dart';
import 'dart:math';

class ColorChangeClass extends StatefulWidget {
  const ColorChangeClass({super.key});

  @override
  State<ColorChangeClass> createState() => _ColorChangeState();
}

class _ColorChangeState extends State<ColorChangeClass> {
  Color _backgroundColor = Colors.white;

  void change_color() {
    final Random random = Random();
    setState(() {
      _backgroundColor = Color.fromRGBO(random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: change_color,
      child: Scaffold(
        backgroundColor: _backgroundColor,
        appBar: AppBar(
          title: Text("Random Colors", style: TextStyle(color: Colors.black),),
          backgroundColor: _backgroundColor,
        ),
        body: Center(
          child: Text("Tap Anywhere", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
      ),
    );
  }
}
