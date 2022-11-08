import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:forcard/app/shared/models/user.dart';
import 'package:forcard/screens/home.dart';
import 'package:forcard/screens/sign_up_screen.dart';
import 'package:forcard/values/custom_colors.dart';
import 'package:forcard/values/preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _mailInputController = TextEditingController();
  TextEditingController _passwordInputController = TextEditingController();

  bool continueConnected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 30),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/background.jpg"), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: Image.asset(
                  "assets/Logo.png",
                  height: 200,
                ),
              ),
              Form(
                child: Column(
                  children: [
                    //INPUT EMAIL
                    TextFormField(
                      controller: _mailInputController,
                      autofocus: true,
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

                    //INPUT SENHA
                    TextFormField(
                      controller: _passwordInputController,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                        labelText: "Senha",
                        labelStyle: TextStyle(color: Colors.white),
                        prefixIcon: Icon(
                          Icons.key_outlined,
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
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 15),
              ),

              GestureDetector(
                onTap: () {
                  print("Funcionou");
                },
                child: const Text(
                  "Esqueceu a senha?",
                  textAlign: TextAlign.right,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ),

              const Padding(
                padding: EdgeInsets.only(bottom: 15),
              ),
              //Botão Login
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Home()));
                },
                child: const Text(
                  "Acessar",
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

              Padding(
                padding: EdgeInsets.only(bottom: 10),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpScreen()));
                  },
                  child: Text(
                    "Não possui uma conta? Registre agora.",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _doLogin() async {
    String mailForm = this._mailInputController.text;
    String passForm = this._passwordInputController.text;

    User saveUser = await _getSavedUser();

    if (mailForm == saveUser.mail && passForm == saveUser.hashCode) ;
    print("LOGIN EFETUADO COM SUCESSO.");
  }

  //TODO: Revisar este ponto
  Future<User> _getSavedUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //String jsonUser = prefs.getString(PreferencesKeys.activeUser);
    prefs.getString(PreferencesKeys.activeUser);

    Map<String, dynamic> map = jsonDecode(toString());
    User user = User.fromJson(map);
    return user;
  }
}
