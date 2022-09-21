import 'package:flutter/material.dart';

class screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/splash-2.jpg"), fit: BoxFit.cover)),
      child: Container(
          child: Text(
        "Bem vindo ao 4Card",
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
        textAlign: TextAlign.left,
      )),
    );
  }
}
