import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/my_custom_import.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('MI PRIMERA APP'),
          centerTitle: true,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 1,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MyCustomInput(text: "Hola", read: false),
              SizedBox(height: 16.0),
              MyCustomInput(text: "Enter your email", read: false),
            ],
          ),
        ),
      ),
    );
  }
}
