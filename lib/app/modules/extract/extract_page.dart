import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ExtractPage extends StatefulWidget {
  const ExtractPage({super.key});

  @override
  State<ExtractPage> createState() => _ExtractPageState();
}

class _ExtractPageState extends State<ExtractPage> {
  Widget cardItem() {
    return Container(
      width: 480,
      height: 80,
      child: Card(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 80,
                height: 60,
                color: const Color(0xffFFC803),
                child: Image.asset(
                  'assets/onibus.png',
                  scale: 10,
                  color: Colors.white,
                ),
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    'Ônibus',
                    style: TextStyle(color: Color(0xffFFC803), fontSize: 21),
                  ),
                  Text('08/11/2022',
                      style: TextStyle(color: Color(0xff6F6F6F), fontSize: 10)),
                ],
              ),
            ),
            Container(
              width: 50,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
                bottom: 21,
                top: 8,
              ),
              child: Text('13:45',
                  style: TextStyle(color: Color(0xff6F6F6F), fontSize: 19)),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
            onPressed: () {
              Modular.to.navigate('/home');
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: const Text(
          'Extrato',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [cardItem(), cardItem(), cardItem()],
      ),
    );
  }
}
