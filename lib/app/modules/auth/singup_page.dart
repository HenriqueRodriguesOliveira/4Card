import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forcard/app/modules/auth/components/input_email.dart';
import 'package:forcard/app/shared/models/user.dart';
import 'package:forcard/values/custom_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SingUpPage extends StatefulWidget {
  const SingUpPage({super.key});

  @override
  State<SingUpPage> createState() => _SingUpPageState();
}

class _SingUpPageState extends State<SingUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameInputController = TextEditingController();
  final TextEditingController _mailInputController = TextEditingController();
  final TextEditingController _passwordInputController =
      TextEditingController();
  final TextEditingController _confirmInputController = TextEditingController();

  bool showPassword = false;

  _validateName(String? name) {
    if (name!.isEmpty) {
      return 'O campo E-mail não pode está vazio';
    } else if (name.length < 3) {
      return 'O nome está muito curto. Tente inserir seu sobrenome também.';
    }
    return null;
  }

  _validatePassword(String? password) {
    if (password!.isEmpty) {
      return 'O campo não pode está vazio';
    } else if (password.length < 6) {
      return 'A senha deve possuir pelo menos 6 caracteres';
    }
    return null;
  }

  _validateConfirmPassword(String? password) {
    print(_passwordInputController.value);
    if (password!.isEmpty) {
      return 'O campo não pode está vazio';
    } else if (password != _passwordInputController.value.text) {
      return 'A senhas não coincidem.';
    }
    return null;
  }

  _validateForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cadastro realizado com sucesso!')),
      );
      Modular.to.pushNamed("/auth");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Erro ao tentar realizar o cadastro!')),
      );
    }
  }

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
              const Text("Cadastrar contas",
                  style: TextStyle(color: Colors.white, fontSize: 25)),
              Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameInputController,
                        validator: (v) => _validateName(v),
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
                      InputEmail(),
                      TextFormField(
                        controller: _passwordInputController,
                        validator: (v) => _validatePassword(v),
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
                      ),
                      TextFormField(
                        controller: _confirmInputController,
                        obscureText: true,
                        validator: (v) => _validateConfirmPassword(v),
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
                          // const Text(
                          //   "Mostrar a senha",
                          //   style: TextStyle(color: Colors.white),
                          // )
                        ],
                      ),
                      //Button Cadastrar
                      ElevatedButton(
                        onPressed: () {
                          _validateForm();
                        },
                        style: ButtonStyle(
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              const EdgeInsets.fromLTRB(100, 12, 115, 12)),
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
    User newUser = User(
        name: _nameInputController.text,
        mail: _mailInputController.text,
        password: _passwordInputController.text,
        keepOn: true);

    // print(newUser);
    _saveUser(newUser);
  }

  void _saveUser(User user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(
      "LOGGIN_USER_INFO",
      json.encode(user.toJson()),
    );
  }
}
