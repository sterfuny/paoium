import 'package:flutter/material.dart';

class ScaleGesturelayout extends StatefulWidget {
  final List<Widget> ctrlLine;

  const ScaleGesturelayout({Key? key, required this.ctrlLine})
    : super(key: key);

  @override
  _ScaleGesturelayoutState createState() => _ScaleGesturelayoutState();
}

class _ScaleGesturelayoutState extends State<ScaleGesturelayout> {
  double _scaleFactor = 1.0;
  double _nowScaleFactor = 1.0;
  int _index = 0;
  double _scaleIndex = 1.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onScaleStart: (ScaleStartDetails details) {
        _nowScaleFactor = _scaleFactor;
        // 记录开始缩放时的基准值
      },
      onScaleUpdate: (ScaleUpdateDetails details) {
        setState(() {
          _scaleFactor = details.scale;
          // 当缩放超过阈值时处理切换
          if (_scaleFactor >= _scaleIndex + 1.0) {
            _handleScaleThreshold(1);
          }
          if (_scaleFactor <= _scaleIndex - 0.5) {
            _handleScaleThreshold(-1);
          }
        });
      },
      onScaleEnd: (ScaleEndDetails details) {
        setState(() {
          // 结束时复位
          _scaleFactor = 1.0;
          // _scaleNum = 1.0;
          _scaleIndex = 1.0;
        });
      },
      child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: widget.ctrlLine.isNotEmpty ? widget.ctrlLine[_index] : null,
      ),
    );
  }

  void _handleScaleThreshold(int trun) {
    // 切换控件
    if (trun != 0) {
      // _scaleNum += 0.5;
      if ((trun >= 0 && _index + trun <= widget.ctrlLine.length - 1) ||
          (trun <= 0 && _index + trun >= 0)) {
        _index += trun;
        _scaleIndex = _scaleFactor.floor().toDouble();
      }
    }
    // 使用动画平滑过渡
    Future.delayed(Duration(milliseconds: 100), () {
      if (mounted) {
        setState(() {
          // _scaleFactor = 1.0;
          _nowScaleFactor = 1.0;
        });
      }
    });
  }
}
