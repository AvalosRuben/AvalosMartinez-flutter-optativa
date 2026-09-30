import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CarritoScreen extends StatefulWidget {
  const CarritoScreen({Key? key}) : super(key: key);

  @override
  // CORRECCIÓN: Se especifica el tipo
  State createState() => _CarritoScreenState();
}

// CORRECCIÓN: Se especifica el tipo
class _CarritoScreenState extends State {
  List carts = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchCarts();
  }

  // IMPLEMENTACIÓN DE LA API
  Future _fetchCarts() async {
    try {
      final response = await http.get(
        Uri.parse('https://fakestoreapi.com/carts'),
      );

      if (!mounted) return;

      if (response.statusCode == 200) {
        setState(() {
          carts = json.decode(response.body);
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = 'Error al cargar los carritos: ${response.statusCode}';
          isLoading = false;
        });
      }
    } catch (e) {
      if (!mounted) return;

      setState(() {
        errorMessage = 'Error de conexión: $e';
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Ya no necesitamos backgroundColor, lo toma del AppTheme global
      appBar: AppBar(
        // Ya no necesitamos color ni estilos de texto, los toma del AppTheme global
        title: const Text('Carritos de compra'),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : errorMessage != null
          ? Center(
              child: Text(
                errorMessage!,
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
            )
          : carts.isEmpty
          ? const Center(
              child: Text(
                'No hay carritos disponibles',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
            )
          : ListView.builder(
              itemCount: carts.length,
              itemBuilder: (context, index) {
                final cart = carts[index];
                return ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.only(top: 4.0),
                    child: Icon(
                      Icons.local_shipping_outlined,
                      color: Colors.orange.shade700,
                      size: 32,
                    ),
                  ),
                  title: Text(
                    // Accedemos a la propiedad del JSON mapeado
                    'Cliente - ${cart['userId']}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  subtitle: const Text(
                    'Click para ver detalles',
                    style: TextStyle(fontSize: 13, color: Colors.grey),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 8,
                  ),
                  onTap: () {
                    // TODO - Navegar a detalles del carrito enviando cart['id']
                  },
                );
              },
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1, // Mantiene seleccionado "Carritos"
        // Colores omitidos para que herede del AppTheme
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Carritos',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.pop(context);
          }
        },
      ),
    );
  }
}
