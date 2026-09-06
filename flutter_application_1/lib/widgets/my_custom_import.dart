import 'package:flutter/material.dart';

class MyCustomInput extends StatelessWidget {
  final String text;
  final bool read;

  const MyCustomInput({super.key, required this.text, required this.read});

  @override
  Widget build(BuildContext context) {
    return TextField(
      readOnly: read,
      decoration: InputDecoration(
        labelText: text,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
