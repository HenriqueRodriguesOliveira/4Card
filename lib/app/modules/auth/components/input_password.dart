import 'package:flutter/material.dart';

class InputPassword extends StatelessWidget {
  InputPassword({super.key});
  final TextEditingController _passwordInputController =
      TextEditingController();

  _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Por favor, digite sua senha';
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (v) => _validatePassword(v),
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
    );
  }
}
