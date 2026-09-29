import 'package:flutter/material.dart';

import '../models/cart_model.dart';

class CarritoScreen extends StatefulWidget {
  const CarritoScreen({Key? key}) : super(key: key);

  @override
  State createState() => _CarritoScreenState();
}

class _CarritoScreenState extends State {
  List carts = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchCarts();
  }

  Future _fetchCarts() async {
    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      carts = [];
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = const Color(0xFF2196F3);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Carritos de compra',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : carts.isEmpty
          ? const Center(
              child: Text(
                'No hay carritos disponibles\n(Esperando conexión a API)',
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
                    'Cliente - ${cart.userId}',
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
                  onTap: () {},
                );
              },
            ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        selectedItemColor: primaryColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Inicio'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
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
