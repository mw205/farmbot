import 'dart:math';

import 'package:flutter/material.dart';

class Watermark extends StatelessWidget {
  final int rowCount;
  final int columnCount;
  final String text;

  const Watermark(
      {super.key,
      required this.rowCount,
      required this.columnCount,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Column(
        children: createColumnWidgets(),
      ),
    );
  }

  List<Widget> createRowWidgets() {
    List<Widget> list = [];
    for (var i = 0; i < rowCount; i++) {
      final widget = Expanded(
        child: Center(
          child: Transform.rotate(
            angle: pi / 10,
            child: Text(
              text,
              style: TextStyle(
                  color: Colors.black.withOpacity(0.2),
                  fontSize: 18,
                  decoration: TextDecoration.none),
            ),
          ),
        ),
      );
      list.add(widget);
    }
    return list;
  }

  List<Widget> createColumnWidgets() {
    List<Widget> list = [];
    for (var i = 0; i < columnCount; i++) {
      final widget = Expanded(
        child: Row(
          children: createRowWidgets(),
        ),
      );
      list.add(widget);
    }
    return list;
  }
}
