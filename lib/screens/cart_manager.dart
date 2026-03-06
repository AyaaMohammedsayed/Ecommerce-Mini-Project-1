class CartItem {
  final String name;
  final double price;
  final String image;
  int qty;

  CartItem({
    required this.name,
    required this.price,
    required this.image,
    this.qty = 1,
  });
}

class CartManager {
  static List<CartItem> selectedItems = [];

  // inside cart_manager.dart
static void addProduct(Map<String, String> product) {
  int index = selectedItems.indexWhere((item) => item.name == product['name']);
  
  if (index != -1) {
    selectedItems[index].qty++;
  } else {
    selectedItems.add(CartItem(
      name: product['name'] ?? 'Unknown Product',
      // Provide a default empty string or a placeholder image URL if null
      price: double.tryParse(product['price'] ?? '0.0') ?? 0.0,
      image: product['image'] ?? 'https://via.placeholder.com/150', 
    ));
  }
}
}