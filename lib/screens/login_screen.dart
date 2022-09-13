import 'package:flutter/material.dart';
import 'package:forcard/values/custom_colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool continueConnected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 50, vertical: 30),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/background.jpg"),
                    fit: BoxFit.cover)),
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
                  /*Text(
                    "Entrar",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),*/
                  Form(
                    child: Column(
                      children: [
                        //INPUT EMAIL
                        TextFormField(
                          autofocus: true,
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

                        //INPUT SENHA
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
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
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                  ),
                  GestureDetector(
                    onTap: () {
                      print("Funcionou");
                    },
                    child: Text(
                      "Esqueceu a senha?",
                      textAlign: TextAlign.right,
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10),
                  ),
                  Row(
                    children: [
                      Checkbox(
                          activeColor: Colors.yellow[700],
                          value: continueConnected,
                          onChanged: (value) {
                            setState(() {
                              this.continueConnected = value!;
                            });
                          }),
                      Text(
                        "Mostrar a senha",
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),

                  //Botão Login
                  ElevatedButton(
                    onPressed: () {},
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
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Divider(color: Colors.white),
                  ),

                  //Botao Cadastrar
                  Text(
                    "Ainda não tem uma conta?",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 11, color: Colors.white),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        "Cadastre-se",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            CustomColors().getActiveSecondaryButtonColor()),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )));
  }
}
