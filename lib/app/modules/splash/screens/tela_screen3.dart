import 'package:flutter/material.dart';

class screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/splash-3.jpg"), fit: BoxFit.cover)),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 450.0, right: 30.0),
            child: Center(
              child: Text('TRANSPORTE SEGURO',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10.0, left: 10),
            child: Container(
              child: const Text(
                  'Nós nos preocupamos com a sua segurança, nossos transportes são revisados diariamente.',
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
