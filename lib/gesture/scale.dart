import 'package:flutter/material.dart';

class ScaleGesturelayout extends StatefulWidget {
  @override
  _ScaleGesturelayoutState createState() => _ScaleGesturelayoutState();
}

class _ScaleGesturelayoutState extends State<ScaleGesturelayout> {
  double _scaleFactor = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleUpdate: (ScaleUpdateDetails details) {
        setState(() {
          print("update");
          _scaleFactor = 1.0;
          _scaleFactor *= details.scale;
        });
      },
      child: Container(
        color: Colors.blue[50],
        width: double.infinity,
        height: double.infinity,
        
        child: Text(
          "ScaleFactor: $_scaleFactor",
          style: TextStyle(fontSize: _scaleFactor*20.0),
        ),
      ),
    );
  }
}