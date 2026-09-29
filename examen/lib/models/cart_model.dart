class ProductItem {
  final int productId;
  final int quantity;

  ProductItem({required this.productId, required this.quantity});

  factory ProductItem.fromJson(Map json) {
    return ProductItem(
      productId: json['productId'],
      quantity: json['quantity'],
    );
  }
}

class Cart {
  final int id;
  final int userId;
  final String date;
  final List products;

  Cart({
    required this.id,
    required this.userId,
    required this.date,
    required this.products,
  });

  factory Cart.fromJson(Map json) {
    var productsList = json['products'] as List;
    List parsedProducts = productsList
        .map((i) => ProductItem.fromJson(i))
        .toList();

    return Cart(
      id: json['id'],
      userId: json['userId'],
      date: json['date'],
      products: parsedProducts,
    );
  }
}
