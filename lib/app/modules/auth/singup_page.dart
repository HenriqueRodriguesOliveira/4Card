import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:forcard/models/user.dart';
import 'package:forcard/values/custom_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({super.key});

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  final TextEditingController _nameInputController = TextEditingController();
  final TextEditingController _mailInputController = TextEditingController();
  final TextEditingController _passwordInputController =
      TextEditingController();
  final TextEditingController _confirmInputController = TextEditingController();

  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.jpg"), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Image.asset(
                  "assets/Logo.png",
                  height: 200,
                ),
              ),
              const Text("Cadastrar conta",
                  style: TextStyle(color: Colors.white, fontSize: 25)),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    controller: _nameInputController,
                    autofocus: true,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255)),
                    decoration: const InputDecoration(
                      labelText: "Nome completo",
                      labelStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(
                        Icons.account_circle_outlined,
                        color: Colors.white,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow),
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: _nameInputController,
                    autofocus: true,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255)),
                    decoration: const InputDecoration(
                      labelText: "Cpf",
                      labelStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(
                        Icons.account_circle_outlined,
                        color: Colors.white,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow),
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: _mailInputController,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: "E-mail",
                      labelStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(
                        Icons.mail_outline,
                        color: Colors.white,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow),
                      ),
                    ),
                  ),
                  (showPassword == false)
                      ? TextFormField(
                          controller: _passwordInputController,
                          obscureText: true,
                          style: const TextStyle(color: Colors.white),
                          decoration: const InputDecoration(
                            labelText: "Senha",
                            labelStyle: TextStyle(color: Colors.white),
                            prefixIcon: Icon(
                              Icons.vpn_key,
                              color: Colors.white,
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.yellow),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.yellow),
                            ),
                          ),
                        )
                      : Container(),
                  TextFormField(
                    controller: _confirmInputController,
                    obscureText: (showPassword == true) ? false : true,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      labelText: "Confirme a Senha",
                      labelStyle: TextStyle(color: Colors.white),
                      prefixIcon: Icon(
                        Icons.vpn_key_outlined,
                        color: Colors.white,
                      ),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: showPassword,
                        onChanged: (value) {
                          setState(() {
                            showPassword = value!;
                          });
                        },
                        checkColor: Colors.yellow,
                        activeColor: Colors.yellow[600],
                      ),
                      const Text(
                        "Mostrar a senha",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 25),
                  ),
                  //Button Cadastrar
                  ElevatedButton(
                    onPressed: () {
                      _doSignUp();
                      Navigator.pop(context);
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.fromLTRB(115, 12, 115, 12)),
                      backgroundColor: MaterialStateProperty.all(
                          CustomColors().getActivePrimaryButtonColor()),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    child: const Text(
                      "Criar Conta",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                  ),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

  //
  void _doSignUp() {
    Autogenerated newUser = Autogenerated(
        name: _nameInputController.text,
        mail: _mailInputController.text,
        password: _passwordInputController.text,
        keepOn: true);

    // print(newUser);
    _saveUser(newUser);
  }

  void _saveUser(Autogenerated user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
      "LOGGIN_USER_INFO",
      json.encode(user.toJson()),
    );
  }
}
