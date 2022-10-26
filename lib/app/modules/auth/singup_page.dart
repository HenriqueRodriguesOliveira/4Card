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
  TextEditingController _nameInputController = TextEditingController();
  TextEditingController _mailInputController = TextEditingController();
  TextEditingController _passwordInputController = TextEditingController();
  TextEditingController _confirmInputController = TextEditingController();

  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.jpg"), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Image.asset(
                  "assets/Logo.png",
                  height: 200,
                ),
              ),
              Text("Cadastrar conta",
                  style: const TextStyle(color: Colors.white, fontSize: 25)),
              Form(
                  child: Column(
                children: [
                  TextFormField(
                    controller: _nameInputController,
                    autofocus: true,
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    decoration: InputDecoration(
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
                    style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                    decoration: InputDecoration(
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
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
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
                  (this.showPassword == false)
                      ? TextFormField(
                          controller: _passwordInputController,
                          obscureText: true,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
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
                    obscureText: (this.showPassword == true) ? false : true,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
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
                            this.showPassword = value!;
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
                    child: Text(
                      "Criar Conta",
                      style: TextStyle(color: Colors.white, fontSize: 15),
                    ),
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          EdgeInsets.fromLTRB(115, 12, 115, 12)),
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

    print(newUser);
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
