import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:forcard/app/modules/auth/components/input_email.dart';
import 'package:forcard/app/modules/auth/components/input_password.dart';
import 'package:forcard/app/shared/models/user.dart';
import 'package:forcard/screens/sign_up_screen.dart';
import 'package:forcard/values/custom_colors.dart';
import 'package:forcard/values/preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  bool continueConnected = false;

  _validateForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Hello!')),
      );
      // Navigator.push(context,
      //     MaterialPageRoute(builder: (context) => Home()));
    }
  }

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
                padding: const EdgeInsets.only(bottom: 10),
                child: Image.asset(
                  "assets/Logo.png",
                  height: 200,
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [InputEmail(), InputPassword()],
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
              ElevatedButton(
                onPressed: () {
                  _validateForm();
                },
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
                child: const Text(
                  "Acessar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpScreen()));
                  },
                  child: const Text(
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

  // void _doLogin() async {
  //   String mailForm = this._mailInputController.text;
  //   String passForm = this._passwordInputController.text;

  //   User saveUser = await _getSavedUser();

  //   if (mailForm == saveUser.mail && passForm == saveUser.hashCode) ;
  //   print("LOGIN EFETUADO COM SUCESSO.");
  // }

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
