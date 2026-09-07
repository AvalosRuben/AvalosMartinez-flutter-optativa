import 'package:flutter/material.dart';

class Calcbutton extends StatelessWidget {
  final int numero;
  final VoidCallback onPress;

  const Calcbutton({super.key, required this.numero, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(20)),
      child: Text(numero.toString()),
    );
  }
}
