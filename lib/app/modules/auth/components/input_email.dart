import 'package:flutter/material.dart';

class InputEmail extends StatelessWidget {
  InputEmail({super.key});
  final TextEditingController _mailInputController = TextEditingController();

  _validateEmail(String? email) {
    const regexEmail =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

    if (!RegExp(regexEmail).hasMatch(email!)) {
      return 'Digite um email válido';
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _mailInputController,
      autofocus: true,
      style: const TextStyle(color: Colors.white),
      validator: (v) => _validateEmail(v),
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
    );
  }
}
