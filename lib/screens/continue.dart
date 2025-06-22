import 'package:flutter/material.dart';
import '/gesture/scale.dart';

final List<Widget> widgetline = [
  Scaffold(
    appBar: AppBar(backgroundColor: Colors.lightBlue, title: Text("Scaffold1")),
    body: Center(child: Text("Scaffold1")),
  ),
  Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.lightGreen,
      title: Text("Scaffold2"),
    ),
    body: Center(child: Text("Scaffold2")),
  ),
  Scaffold(
    appBar: AppBar(backgroundColor: Colors.amber, title: Text("Scaffold3")),
    body: Center(child: Text("Scaffold3")),
  ),
];

class ContinueScreen extends StatelessWidget {
  const ContinueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScaleGesturelayout(ctrlLine: widgetline);
  }
}
