import 'package:flutter/material.dart';

class Calcbutton extends StatelessWidget {
  final String numero;

  const Calcbutton({super.key, required this.numero});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () => {}, child: Text(numero));
  }
}
