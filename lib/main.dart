import 'package:flutter/material.dart';
import './gesture/scale.dart';

void main() {
  runApp(const MainApp());
}

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
    appBar: AppBar(backgroundColor: Colors.lightBlue, title: Text("Scaffold3")),
    body: Center(child: Text("Scaffold3")),
  ),
];

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
      ),
      home: HostScaff(),
    );
  }
}

class HostScaff extends StatelessWidget {
  const HostScaff({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("HostScaff"),
      ),

      body: ScaleGesturelayout(ctrlLine: widgetline),
    );
  }
}
