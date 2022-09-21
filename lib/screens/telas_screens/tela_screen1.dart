import 'package:flutter/material.dart';

class screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/splash-1.jpg"), fit: BoxFit.cover)),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 400.0, right: 20.0),
            child: Center(
              child: Text('BEM VINDO AO 4CARD!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 10),
            child: Container(
              child: Text(
                  'O nosso compromisso é tornar o seu dia a dia mais fácil!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
