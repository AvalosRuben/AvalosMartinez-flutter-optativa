import 'package:flutter/material.dart';

class Calcbutton extends StatelessWidget {
  final int numero;

  const Calcbutton({super.key, required this.numero});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {},
      style: ElevatedButton.styleFrom(padding: const EdgeInsets.all(20)),
      child: Text(numero.toString()),
    );
  }
}
