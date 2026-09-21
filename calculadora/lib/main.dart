import 'package:calculadora/components/menuButton.dart';
import 'package:calculadora/pages/calculator.dart';
import 'package:calculadora/pages/pantalla2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: MainMenu());
  }
}

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Menu'),
          centerTitle: true,
          backgroundColor: Colors.indigoAccent,
          foregroundColor: Colors.white,
          elevation: 1,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              menuButton(
                context,
                label: "Calculadora",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Calculator()),
                  );
                },
              ),
              menuButton(
                context,
                label: "Pantalla 2",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Pantalla2()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
