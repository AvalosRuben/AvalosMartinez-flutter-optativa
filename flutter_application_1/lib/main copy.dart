import 'package:flutter/material.dart';

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
              const Text(
                'FORMULARIO DE ALUMNO',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.1,
                ),
              ),
              const SizedBox(height: 20),

              // Nombre Input
              TextField(
                decoration: InputDecoration(
                  labelText: 'NOMBRE',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Apellido Input
              TextField(
                decoration: InputDecoration(
                  labelText: 'APELLIDO',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Guardar Button
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text('GUARDAR'),
              ),
              const SizedBox(height: 24),

              // Row of Icons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton.outlined(
                    onPressed: () {},
                    icon: const Icon(Icons.star),
                    tooltip: 'ICON1',
                  ),
                  const SizedBox(width: 16),
                  IconButton.outlined(
                    onPressed: () {},
                    icon: const Icon(Icons.favorite),
                    tooltip: 'ICON2',
                  ),
                  const SizedBox(width: 16),
                  IconButton.outlined(
                    onPressed: () {},
                    icon: const Icon(Icons.person),
                    tooltip: 'ICON3',
                  ),
                ],
              ),
              const SizedBox(height: 24),

              const Text(
                'ESTA ES MI IMAGEN',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 12),

              // Placeholder Image Box
              Container(
                width: 200,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.grey[400]!),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'IMAGEN',
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
