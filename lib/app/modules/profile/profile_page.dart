import 'package:flutter/material.dart';

import '../../../values/custom_colors.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text('Perfil'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 50, top: 30),
            child: Center(
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  color: Colors.amber,
                ),
              ),
            ),
          ),
          Container(
            width: 350,
            height: 200,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 240, 240, 240),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Nome: Cielo Musk',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'Número: (85) 40028922',
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    'E-mail: email@email.com',
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              "Alterar o Perfil",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.fromLTRB(115, 15, 115, 15)),
              backgroundColor: MaterialStateProperty.all(
                  CustomColors().getActivePrimaryButtonColor()),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: const Text(
              "Sair da conta",
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
            style: ButtonStyle(
              padding: MaterialStateProperty.all<EdgeInsets>(
                  const EdgeInsets.fromLTRB(115, 15, 115, 15)),
              backgroundColor: MaterialStateProperty.all(
                  CustomColors().getActivePrimaryButtonColor()),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
