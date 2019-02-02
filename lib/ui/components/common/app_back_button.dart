import 'package:flutter/material.dart';

class AppBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // NOTE : This widget should be build inside Stack widget
    return Positioned(
      top: 36.0,
      left: 20.0,
      child: FloatingActionButton(
        elevation: 0,
        heroTag: null,
        mini: true,
        backgroundColor: Colors.green,
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.arrow_back_ios),
      ),
    );
  }
}
