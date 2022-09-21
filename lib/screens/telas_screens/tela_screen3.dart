import 'package:flutter/material.dart';

class screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/splash-3.jpg"), fit: BoxFit.cover)),
    );
  }
}
