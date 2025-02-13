// import 'package:flutter/material.dart';
// import 'package:trying_learn/screens/home_screen.dart';
// import 'package:trying_learn/widgets/task_dialog.dart';
// import '../screens/settings_screen.dart';
//
// class BottomNavigation extends StatefulWidget {
//   const BottomNavigation({super.key});
//
//   @override
//   State<BottomNavigation> createState() => _BottomNavigationState();
// }
//
// class _BottomNavigationState extends State<BottomNavigation> {
//   int _selectedIndex = 0;
//   final Function(String) add_task;
//
//   static const List<Widget> _options = <Widget>[
//     HomeScreen(),
//     SettingsScreen(),
//   ];
//
//   void _onTapped(int index) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => _options[index]),
//     );
//   }
//
//   void _showAddDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context)
//       {
//         return TaskDialog(
//           onAddTask: add_task,
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _options[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         items: <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: "Home",
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: "Settings",
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.blueAccent,
//       ),
//
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           _showAddDialog();
//         },
//         child: Icon(Icons.add, color: Colors.black,),
//       ),
//
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//     );
//   }
// }
