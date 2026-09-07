import 'package:flutter/material.dart';

final GlobalKey<ScaffoldMessengerState> messengerKey =
    GlobalKey<ScaffoldMessengerState>();

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  double _resultado = 0;

  void _borrar() {
    setState(() {
      _num1Controller.clear();
      _num2Controller.clear();
      _resultado = 0;
    });
  }

  void _sumar() {
    double n1 = double.tryParse(_num1Controller.text) ?? 0;
    double n2 = double.tryParse(_num2Controller.text) ?? 0;

    setState(() {
      _resultado = n1 + n2;
    });
  }

  void _resta() {
    double n1 = double.tryParse(_num1Controller.text) ?? 0;
    double n2 = double.tryParse(_num2Controller.text) ?? 0;

    setState(() {
      _resultado = n1 - n2;
    });
  }

  void _multiplicacion() {
    double n1 = double.tryParse(_num1Controller.text) ?? 0;
    double n2 = double.tryParse(_num2Controller.text) ?? 0;

    setState(() {
      _resultado = n1 * n2;
    });
  }

  void _division() {
    double n1 = double.tryParse(_num1Controller.text) ?? 0;
    double n2 = double.tryParse(_num2Controller.text) ?? 0;

    if (n2 == 0) {
      messengerKey.currentState?.showSnackBar(
        const SnackBar(
          content: Text("No de puede dividir sobre 0!!"),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.indigoAccent,
        ),
      );
      return;
    }

    if (n1 == 0) {
      messengerKey.currentState?.showSnackBar(
        const SnackBar(
          content: Text("No se dividirá al 0!!"),
          duration: Duration(seconds: 2),
          backgroundColor: Colors.indigoAccent,
        ),
      );
      return;
    }

    setState(() {
      _resultado = n1 / n2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: messengerKey,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Calculadora'),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 1,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Resultado:$_resultado'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextField(
                        controller: _num1Controller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Numero1',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextField(
                        controller: _num2Controller,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Numero2',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: _sumar, child: const Text('SUMAR')),
                  ElevatedButton(onPressed: _resta, child: const Text('RESTA')),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: _multiplicacion,
                    child: const Text('MULTIPLICACIÓN'),
                  ),
                  ElevatedButton(
                    onPressed: _division,
                    child: const Text('DIVISION'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: _borrar, child: Text('BORRAR')),
            ],
          ),
        ),
      ),
    );
  }
}
