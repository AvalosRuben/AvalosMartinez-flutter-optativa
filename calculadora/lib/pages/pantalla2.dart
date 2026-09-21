import 'package:flutter/material.dart';

class Pantalla2 extends StatelessWidget {
  const Pantalla2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla 2'),
        centerTitle: true,
        backgroundColor: Colors.indigoAccent,
        foregroundColor: Colors.white,
        elevation: 1,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            readOnlyButton(label: 'Boton 1'),
            readOnlyButton(label: 'Boton 2'),
            readOnlyButton(label: 'Boton 3'),
            readOnlyButton(label: 'Boton 4'),
            readOnlyButton(label: 'Boton 5'),
          ],
        ),
      ),
    );
  }
}

Widget readOnlyButton({required String label}) {
  return OutlinedButton(
    onPressed: () {},
    style: OutlinedButton.styleFrom(
      backgroundColor: Colors.indigoAccent,
      foregroundColor: Colors.white,
      side: const BorderSide(color: Colors.white, width: 2),
      padding: const EdgeInsets.symmetric(vertical: 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
    child: Text(label),
  );
}
