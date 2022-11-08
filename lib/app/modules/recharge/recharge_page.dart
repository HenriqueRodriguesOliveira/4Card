import 'package:flutter/material.dart';

import '../../../values/custom_colors.dart';

class RechargePage extends StatefulWidget {
  const RechargePage({super.key});

  @override
  State<RechargePage> createState() => _RechargePageState();
}

class _RechargePageState extends State<RechargePage> {
  Widget valueInput() {
    return TextFormField(
      autofocus: true,
      style: const TextStyle(color: Colors.black),
      decoration: const InputDecoration(
        labelText: "Valor da Recarga",
        labelStyle: TextStyle(color: Colors.black),
        prefixIcon: Icon(
          Icons.money,
          color: Colors.black,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }

  Widget cardInput() {
    return TextFormField(
      autofocus: true,
      style: const TextStyle(color: Colors.black),
      decoration: const InputDecoration(
        labelText: "Número do Cartão",
        labelStyle: TextStyle(color: Colors.black),
        prefixIcon: Icon(
          Icons.credit_card,
          color: Colors.black,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }

  Widget cpfInput() {
    return TextFormField(
      autofocus: true,
      style: const TextStyle(color: Colors.black),
      decoration: const InputDecoration(
        labelText: "CPF",
        labelStyle: TextStyle(color: Colors.black),
        prefixIcon: Icon(
          Icons.perm_identity,
          color: Colors.black,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
      ),
    );
  }

  Widget cvcCvvInput() {
    return Container(
      width: 145,
      child: TextFormField(
        autofocus: true,
        style: const TextStyle(color: Colors.black),
        decoration: const InputDecoration(
          labelText: "CVC/CVV",
          labelStyle: TextStyle(color: Colors.black),
          prefixIcon: Icon(
            Icons.security,
            color: Colors.black,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }

  Widget dueDateInput() {
    return Container(
      width: 145,
      child: TextFormField(
        autofocus: true,
        style: const TextStyle(color: Colors.black),
        decoration: const InputDecoration(
          labelText: "Data/Ano",
          labelStyle: TextStyle(color: Colors.black),
          prefixIcon: Icon(
            Icons.calendar_month,
            color: Colors.black,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
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
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: const Text(
          'Recarga',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Form(
              child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                valueInput(),
                Container(
                  height: 30,
                ),
                cardInput(),
                Container(
                  height: 30,
                ),
                Row(
                  children: [
                    cvcCvvInput(),
                    const Spacer(),
                    dueDateInput(),
                  ],
                ),
                Container(
                  height: 30,
                ),
                cpfInput(),
                Container(
                  margin: const EdgeInsets.only(top: 100),
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all<EdgeInsets>(
                          const EdgeInsets.fromLTRB(100, 15, 115, 15)),
                      backgroundColor: MaterialStateProperty.all(
                          CustomColors().getActivePrimaryButtonColor()),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    child: const Text(
                      "Recarrega",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ))
        ],
      ),
    );
  }
}
