import 'package:flutter/material.dart';

import 'theme/app_theme.dart';
import 'pages/login.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme, // Tema global aplicado a toda la app
      home: const LoginScreen(),
    );
  }
}
